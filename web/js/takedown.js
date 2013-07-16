"use strict";

//globals
var screen = {
	width: 25,
	height: 17,
	tileSize: 32
};

var dir = {
	NONE: 0,
	UP: 1,
	RIGHT: 2,
	DOWN: 3,
	LEFT: 4
};

var canvas;
var ctx;

var audio = {};

var heatOnFiring = 20;
var refireRate = 10;
var gunKick = 0;

audio.play = function (sound) {
    console.log(sound);
};

var Pos = function (x, y) {
	this.x = x;
	this.y = y;

	this.equals = function(other) {
		return (this.x === other.x && this.y === other.y);
	}

	this.clone = function() {
		return new Pos(this.x, this.y);
	}

	//TODO: manhatten mode is never used, remove it?
	//It was used for enemy movement before we had pathfinding
	this.dirTowards = function(other, manhatten) {
		if (manhatten !== true) {
			manhatten = false;
		}
		var dX = this.x - other.x;
		var dY = this.y - other.y;
		var dirTowards = dir.NONE;
		if (this.equals(other)) {
			return dir.NONE;
		}
		var xIsLargest = (Math.abs(dX) > Math.abs(dY));
		var yIsLargest = (Math.abs(dY) > Math.abs(dX));
		if (dX != 0 && 
			((xIsLargest && !manhatten) || (yIsLargest && manhatten) || dY == 0)) {
			if (dX > 0) {
				dirTowards =  dir.LEFT;
			} else {
				dirTowards = dir.RIGHT;
			}
		} else {
			if (dY > 0) {
				dirTowards = dir.UP;
			} else {
				dirTowards = dir.DOWN;
			}
		}
		return dirTowards;
	}

	//next step in the walkable path from here to there
	this.dirOnPathTowards = function(other, world) {
		//ok, here goes... calculate the cost to walk from every square to the other pos
		var thisStep = [];
		var nextStep = [];
		var closed = [];
		thisStep.push(other);
		var cost = 0;
		while (thisStep.length > 0 || nextStep.length > 0) {
			if (thisStep.length === 0) {
				thisStep = nextStep;
				nextStep = [];
				cost++;
			}
			var next = thisStep.pop();
			var key = next.x + ":" + next.y;
			var existingValue = closed[key];
			if (existingValue === null || existingValue === undefined || existingValue > cost) {
				if (world.map.canMove(next)) {
					closed[key] = cost;
					nextStep.push(new Pos(next.x + 1, next.y));
					nextStep.push(new Pos(next.x - 1, next.y));
					nextStep.push(new Pos(next.x, next.y + 1));
					nextStep.push(new Pos(next.x, next.y - 1));
				}
			}
		}
		//now we have our path, which of our possible moves is the best?
		var options = []; //the index of this array is special, it's the direction to move
		options[dir.NONE] = 10000;
		options[dir.UP] = closed[(this.x) + ":" + (this.y - 1)];
		options[dir.LEFT] = closed[(this.x - 1) + ":" + (this.y)];
		options[dir.DOWN] = closed[(this.x) + ":" + (this.y + 1)];
		options[dir.RIGHT] = closed[(this.x + 1) + ":" + (this.y)];

		var bestSoFar = 10000 - 1;
		var bestDir = 0;
		for (var i = 0; i < 5; i++) {
			if (options[i] != undefined && options[i] < bestSoFar) {
				bestSoFar = options[i];
				bestDir = i;
			}
		}
		return bestDir;
	}
}

var Camera = function (startPos, mapWidth, mapHeight) {
	var pos = startPos.clone();
	var maxX = mapWidth;
	var maxY = mapHeight;
	
	var scrollSpeed = function(dist) {
		if (dist <1) return 0.1;
		if (dist < 5) return 0.2;
		if (dist < 9) return 0.3;
		return 0.5;
	};

	//public
	this.xOff = function () {
		var xOff = (pos.x - screen.width / 2);
		if (xOff < 0) xOff = 0;
		if (xOff > maxX - screen.width) xOff = maxX - screen.width;
		return Math.floor(xOff * screen.tileSize);
	};

	this.yOff = function() {
		var yOff = (pos.y - screen.height / 2);
		if (yOff < 0) yOff = 0;
		if (yOff > maxY - screen.height) yOff = maxY - screen.height;
		return Math.floor(yOff * screen.tileSize);
	};

	this.update = function(target) {
		var xDist = Math.abs(pos.x - target.x);
		var xSpeed = scrollSpeed(xDist);
		if (target.x > pos.x) pos.x += xSpeed;
		if (target.x < pos.x) pos.x -= xSpeed;

		var yDist = Math.abs(pos.y - target.y);
		var ySpeed = scrollSpeed(yDist);
		if (target.y > pos.y) pos.y += ySpeed;
		if (target.y < pos.y) pos.y -= ySpeed;
	}
};

var PlayerAI = function () {
	this.moveDir = dir.NONE;
	this.fireDir = dir.NONE;
	this.fireMode = -1;

	this.move = function(world) {
		return this.moveDir;
	}

	this.shoot = function(world) {
		return {dir: this.fireDir, mode: this.fireMode};
	}
}

var AI = function () {
	this.owner = null; //must be set by Person
	this.moveTarget = null;

	this.move = function(world) {
		while (this.moveTarget === null || this.owner.pos.equals(this.moveTarget)) {
			this.moveTarget = world.getRandomPos();
		}

		return this.owner.pos.dirOnPathTowards(this.moveTarget, world);
	}

	var NO_SHOOT = {dir: dir.NONE, mode: -1};

	this.shoot = function(world) {
		if (world.p.live === false) return NO_SHOOT;
		var shootDir = this.owner.pos.dirTowards(world.p.pos, false);
		if (shootDir == dir.NONE) return NO_SHOOT;

		//1. Is there a clear shot? Is there a straight or L-shaped path from me to the player?
		if (shootDir == dir.LEFT || shootDir == dir.RIGHT) {
			var startX = this.owner.pos.x;
			var endX = world.p.pos.x;
			var startPos = new Pos(startX, this.owner.pos.y);
			var midPos = new Pos(endX, this.owner.pos.y);
		} else {
			var startY = this.owner.pos.y;
			var endY = world.p.pos.y;
			var startPos = new Pos(this.owner.pos.x, startY);
			var midPos = new Pos(this.owner.pos.x, endY);
		}
		var canSee1 = world.map.canSee(startPos, midPos);
		var canSee2 = world.map.canSee(midPos, world.p.pos)
		if (!canSee1 || !canSee2) return NO_SHOOT;

		//2. Is this shot close enough? Either straight, or the player might walk sideways into it?
		var xDist = Math.abs(this.owner.pos.x - world.p.pos.x);
		var yDist = Math.abs(this.owner.pos.y - world.p.pos.y);
		if (shootDir == dir.LEFT || shootDir == dir.RIGHT) {
			var dist = xDist;
			var missAmount = yDist;
		} else {
			var dist = yDist;
			var missAmount = xDist;
		}
		if (dist < 5 && missAmount > 1) return NO_SHOOT;
		if (dist < 10 && missAmount > 2) return NO_SHOOT;
		if (dist < 15 && missAmount > 3) return NO_SHOOT;
		if (missAmount > 4) return NO_SHOOT;

		//Cool, let's shoot then.
		return {dir: shootDir, mode: 2};
	}
}

var Person = function (pos, face, ai) {
	this.moved = 0;
	this.moved = 0;
	this.face = face;
	this.moveSpeed = 4;
	this.shot = 0;
	this.heat = 0;
	this.maxHeat = 120;
	this.pos = pos.clone();
	this.live = true;
	this.health = 5;
	this.ai = ai;
	ai.owner = this;
}

Person.prototype.update = function (world) {
	if (this.live === false) return;

	if (this.moved > 0) {
		this.moved--;
	} else {
		var moveDir = this.ai.move(world);
		if (moveDir > 0) {
			tryMove(this, moveDir, world.map);
		}
	}
	if (moveDir > 0) this.face = moveDir;

	var shootAI = this.ai.shoot(world);
	if (shootAI.dir > 0) this.face = shootAI.dir;

	if (this.shot > 0) {
		this.shot--;
	} else {
		if (shootAI.mode >= 0) {
			this.fire(shootAI.mode, world);
		}
	}

	if (this.heat > 0) {
		this.heat -= 0.5; //TODO: double all heat values and make this 1
		if (this.heat > this.maxHeat) {
			this.heat = this.maxHeat;
		}
	}
};

	//refire rate already checked, but heat not checked
Person.prototype.fire = function (mode, world) {
	if (this.heat >= 100) {
		this.shot = 10;
		audio.play("overheat");
	} else {
		var shotType = mode; //use player gun
		var shot = world.createShot(this.pos, this.face, shotType);
		if (shot !== null) {
			//set up shot stealth, special
		}
		this.heat += heatOnFiring;
		this.shot = refireRate;
		if (this.moved < gunKick) {
			this.moved = gunKick;
		}
	}
};

Person.prototype.hurt = function (damage) {
	if (!this.live) return;
	this.health -= damage;
	if (this.health <= 0) {
		this.live = false;
	}
	this.heat += 25; //does not scale with damage; should it?
}

var createWorld = function(map) {

	var world = {};
	world.shots = [];
	world.enemies = [];
	world.p = null;
	world.map = map;

	var shotUpdate = function(world) {
		if (this.live === false) return;

		if (this.moved > 0) {
			this.moved--;
		} else {
			var moved = tryMove(this, this.face, world.map);
			if (moved===false) {
				this.live = false;
			}
		}

		//check for collisions with the player
		if (this.type == 2) { //non-player shot
			if (world.p.pos.equals(this.pos) && world.p.live === true) {
				world.p.hurt(this.damage);
				this.live = false;
			}
		} else {
			var that = this;
			world.enemies.forEach(function (e) {
				if (e.pos.equals(that.pos) && e.live === true) {
					e.hurt(that.damage);
					that.live = false;
				}
			});
		}
	}

	world.createShot = function(pos, face, shotType) {
		console.log("shot!");
		var shot = {};
		shot.live = true;
		shot.pos = pos.clone();
		shot.face = face;
		shot.type = shotType;
		shot.damage = 1;

		shot.moveSpeed = 1;
		shot.moved = 0;
		this.shots.push(shot);
		shot.update = shotUpdate;
	}

	world.createEnemy = function () {
		var e = new Person(new Pos(10,10), dir.UP, new AI());
		this.enemies.push(e);
		return e;
	};

	world.createPlayer = function (pos, face) {
		this.p = new Person(pos, face, new PlayerAI());
	};

	world.getRandomPos = function () {
		var pos = null;
		while (pos === null || this.map.canMove(pos)===false) {
			var x = Math.floor(Math.random() * this.map.width);
			var y = Math.floor(Math.random() * this.map.height);
			pos = new Pos(x, y);
		}
		return pos;
	}

	return world;
};

var start = function () {
	canvas = document.getElementById('gamescreen');
	ctx = canvas.getContext("2d");
	canvas.width = screen.width * screen.tileSize;
	canvas.height = screen.height * screen.tileSize;
	var keyboard = createKeyboard();

	var world = null;
	var camera = null;
	var campaignLoader = new CampaignLoader();
	campaignLoader.load("./res/01.tdm", function (newWorld) {
		world = newWorld;
		camera = new Camera(world.p.pos, world.map.width, world.map.height);
	});

	//cross browser hacks
	var requestAnimationFrame = window.requestAnimationFrame || window.mozRequestAnimationFrame ||
		window.webkitRequestAnimationFrame || window.msRequestAnimationFrame;
  	window.requestAnimationFrame = requestAnimationFrame;

	window.setInterval(function () {
		update(world, keyboard, camera);
		requestAnimationFrame(function() {
			render(world, camera);
		});
	}, 40);
};

var updatePlayerInput = function (keyboard, playerAI) {
	var face = 0;
	if (keyboard.isKeyDown(KeyEvent.DOM_VK_UP)) face = dir.UP;
	if (keyboard.isKeyDown(KeyEvent.DOM_VK_RIGHT)) face = dir.RIGHT;
	if (keyboard.isKeyDown(KeyEvent.DOM_VK_DOWN)) face = dir.DOWN;
	if (keyboard.isKeyDown(KeyEvent.DOM_VK_LEFT)) face = dir.LEFT;

	var fireMode = -1;
	if (keyboard.isKeyDown(KeyEvent.DOM_VK_M)) {
		fireMode = 0;
	} else if (keyboard.isKeyDown(KeyEvent.DOM_VK_N)) {
		fireMode = 1;
	}

	playerAI.moveDir = face;
	playerAI.fireDir = face;
	playerAI.fireMode = fireMode;
}

var update = function (world, keyboard, camera) {
	if (world === null) return;
	updatePlayerInput(keyboard, world.p.ai);
	world.p.update(world);

	world.enemies.forEach(function(e) {
		e.update(world, 1, 1, 2);
	});

	world.shots.forEach(function(shot) {
		shot.update(world);
	});

	camera.update(world.p.pos);
};

//global...
var tryMove = function (o, face, map) {
	var movedPos = o.pos.clone();
	if (face === dir.UP) movedPos.y--;
	if (face === dir.RIGHT) movedPos.x++;
	if (face === dir.DOWN) movedPos.y++;
	if (face === dir.LEFT) movedPos.x--;
	if (map.canMove(movedPos)) {
		o.pos = movedPos;
		o.moved = o.moveSpeed;
		return true;
	}
	return false;
};

// Draw everything
var render = function (world, camera) {
	if (world === null) return;

	world.map.forEach(function (pos, tile) {
		if (tile === 0) {
			drawSquare(pos, "green", camera);
		} else {
			drawSquare(pos, "grey", camera);
		}
	});

	world.shots.forEach(function (shot) {
		drawSquare(shot.pos, shot.live === true ? "red" : "orange", camera);
	});

	world.enemies.forEach(function (e) {
		drawSquare(e.pos, e.live === true ? "cyan" : "black", camera);
	});

	drawSquare(world.p.pos, world.p.live === true ? "blue": "black", camera);

	ctx.fillStyle = (world.p.heat < 100)  ? "white" : "red";
	ctx.font = '32px Calibri, Candara, Segoe, "Segoe UI", Optima, Arial, sans-serif';
	ctx.fillText("Heat: " + Math.floor(world.p.heat), 40, screen.height * screen.tileSize - 32);
	ctx.fillStyle = "white";
	ctx.fillText("Health: " + world.p.health, screen.width * screen.tileSize - 200, screen.height * screen.tileSize - 32);
};

var drawSquare = function (pos, color, camera) {
	ctx.fillStyle = color;
	ctx.fillRect(pos.x*screen.tileSize - camera.xOff(), pos.y*screen.tileSize - camera.yOff(), screen.tileSize, screen.tileSize);
}

var createGrid = function (myWidth, myHeight) {
	var terrain = []; //t_type
	for (var i = 0; i < myWidth; i ++) {
		terrain[i] = [];
		for (var j = 0; j < myHeight; j++) {
			terrain[i][j] = 0;
			if (Math.random() > 0.95) {
				terrain[i][j] = 1;
			}
		}
	}
	var grid = {};
	grid.width = myWidth;
	grid.height = myHeight;

	grid.canMove = function (pos) {
		if (this.isValid(pos) === false) return false;
		if (this.get(pos) > 0) return false;
		return true;
	}

	grid.isValid = function (pos) {
		if (pos.x < 0 || pos.x >= this.width) {
			return false;
		}
		if (pos.y < 0 || pos.y >= this.height) {
			return false;	
		}
		return true;
	}

	grid.canSee = function (start, end) {
		if (start.x == end.x) {
			var min = Math.min(start.y, end.y);
			var max = Math.max(start.y, end.y);
			for (var i = min; i <= max; i++) {
				if (!this.canMove(new Pos(start.x, i))) return;
			}
			return true;
		}
		if (start.y == end.y) {
			var min = Math.min(start.x, end.x);
			var max = Math.max(start.x, end.x);
			for (var i = min; i <= max; i++) {
				if (!this.canMove(new Pos(i, start.y))) return;
			}
			return true;
		}
		throw "canSee failed because it doesn't handle diagonals";
	}

	grid.get = function (pos) {
		if (!this.isValid(pos)) {
			return 0;
		}
		return terrain[pos.x][pos.y]; 
	}; 

	grid.set = function (pos, value) {
		if (!this.isValid(pos.x, pos.y)) {
			return;
		}
		terrain[pos.x][pos.y] = value;
	}

	grid.forEach = function (func) {
		for (var i = 0; i < this.width; i ++) {
			for (var j = 0; j < this.height; j++) {
				var pos = new Pos(i,j);
				func(pos, this.get(pos));
			}
		}
	}
	return grid;
};

window.onload = start;