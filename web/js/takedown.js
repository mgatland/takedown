"use strict";

//so many globals
var width = 25;
var height = 17;
var tileSize = 32;

var NONE = 0;
var UP = 1;
var RIGHT = 2;
var DOWN = 3;
var LEFT = 4;

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

	this.dirTowards = function(other, manhatten) {
		if (manhatten !== true) {
			manhatten = false;
		}
		var dX = this.x - other.x;
		var dY = this.y - other.y;
		var dir = NONE;
		if (this.equals(other)) {
			return NONE;
		}
		var xIsLargest = (Math.abs(dX) > Math.abs(dY));
		var yIsLargest = (Math.abs(dY) > Math.abs(dX));
		console.log(dX + ":" + dY);
		if (dX != 0 && 
			((xIsLargest && !manhatten) || (yIsLargest && manhatten) || dY == 0)) {
			if (dX > 0) {
				dir =  LEFT;
			} else {
				dir = RIGHT;
			}
		} else {
			if (dY > 0) {
				dir = UP;
			} else {
				dir = DOWN;
			}
		}
		return dir;
	}
}

var PlayerAI = function () {
	this.moveDir = NONE;
	this.fireDir = NONE;
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

		return this.owner.pos.dirTowards(this.moveTarget, true);
	}

	this.shoot = function(world) {
		if (world.p.live === false) {
			return {dir: NONE, mode: -1};
		}
		return {dir: this.owner.pos.dirTowards(world.p.pos, false), mode: 2};
	}
}

var Person = function (pos, ai) {
	this.moved = 0;
	this.moved = 0;
	this.face = 2;
	this.moveSpeed = 4;
	this.shot = 0;
	this.heat = 0;
	this.maxHeat = 120;
	this.pos = pos.clone();
	this.live = true;
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

var createWorld = function() {

	var world = {};
	world.shots = [];
	world.enemies = [];
	world.p = null;

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
				world.p.live = false;
				this.live = false;
			}
		} else {
			var that = this;
			world.enemies.forEach(function (e) {
				if (e.pos.equals(that.pos) && e.live === true) {
					e.live = false;
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

		shot.moveSpeed = 1;
		shot.moved = 0;
		this.shots.push(shot);
		shot.update = shotUpdate;
	}

	world.createEnemy = function () {
		var e = new Person(new Pos(10,10), new AI());
		this.enemies.push(e);
		return e;
	};

	world.createPlayer = function () {
		this.p = new Person(new Pos(5, 5), new PlayerAI());
	};

	world.getRandomPos = function () {
		var x = Math.floor(Math.random() * width);
		var y = Math.floor(Math.random() * height);
		return new Pos(x, y);
	}

	world.createPlayer();
	world.createEnemy();

	return world;
};

var start = function () {
	canvas = document.getElementById('gamescreen');
	ctx = canvas.getContext("2d");
	canvas.width = width * tileSize;
	canvas.height = height * tileSize;
	var keyboard = createKeyboard();

	var world = createWorld();
	world.map = createGrid();
	world.createPlayer();

	//cross browser hacks
	var requestAnimationFrame = window.requestAnimationFrame || window.mozRequestAnimationFrame ||
		window.webkitRequestAnimationFrame || window.msRequestAnimationFrame;
  	window.requestAnimationFrame = requestAnimationFrame;

	window.setInterval(function () {
		update(world, keyboard);
		//render(world);
		requestAnimationFrame(function() {
			render(world);
		});
	}, 40);
};

var update = function (world, keyboard) {
	var face = 0;
	if (keyboard.isKeyDown(KeyEvent.DOM_VK_UP)) face = UP;
	if (keyboard.isKeyDown(KeyEvent.DOM_VK_RIGHT)) face = RIGHT;
	if (keyboard.isKeyDown(KeyEvent.DOM_VK_DOWN)) face = DOWN;
	if (keyboard.isKeyDown(KeyEvent.DOM_VK_LEFT)) face = LEFT;

	var fireMode = -1;
	if (keyboard.isKeyDown(KeyEvent.DOM_VK_M)) {
		fireMode = 0;
	} else if (keyboard.isKeyDown(KeyEvent.DOM_VK_N)) {
		fireMode = 1;
	}

	world.p.ai.moveDir = face;
	world.p.ai.fireDir = face;
	world.p.ai.fireMode = fireMode;
	world.p.update(world);

	world.enemies.forEach(function(e) {
		e.update(world, 1, 1, 2);
	});

	world.shots.forEach(function(shot) {
		shot.update(world);
	});
};

//global...
var tryMove = function (o, face, map) {
	var movedPos = o.pos.clone();
	if (face === UP) movedPos.y--;
	if (face === RIGHT) movedPos.x++;
	if (face === DOWN) movedPos.y++;
	if (face === LEFT) movedPos.x--;
	if (map.canMove(movedPos)) {
		o.pos = movedPos;
		o.moved = o.moveSpeed;
		return true;
	}
	return false;
};

// Draw everything
var render = function (world) {

	world.map.forEach(function (pos, tile) {
		drawSquare(pos, "green");
	});

	drawSquare(world.p.pos, world.p.live === true ? "blue": "black");

	world.shots.forEach(function (shot) {
		drawSquare(shot.pos, shot.live === true ? "red" : "orange");
	});

	world.enemies.forEach(function (e) {
		drawSquare(e.pos, e.live === true ? "grey" : "black");
	});
};

var drawSquare = function (pos, color) {
	ctx.fillStyle = color;
	ctx.fillRect(pos.x*tileSize, pos.y*tileSize, tileSize, tileSize);
}

var createGrid = function () {
	var terrain = []; //t_type
	for (var i = 0; i < width; i ++) {
		terrain[i] = [];
		for (var j = 0; j < height; j++) {
			terrain[i][j] = 0;
		}
	}
	var grid = {};

	grid.canMove = function (pos) {
		if (this.isValid(pos)) return true;
		return false;
	}

	grid.isValid = function (pos) {
		if (pos.x < 0 || pos.x >= width) {
			return false;
		}
		if (pos.y < 0 || pos.y >= height) {
			return false;	
		}
		return true;
	}

	grid.get = function (pos) {
		if (!this.isValid(pos.x, pos.y)) {
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
		for (var i = 0; i < width; i ++) {
			for (var j = 0; j < height; j++) {
				var pos = new Pos(i,j);
				func(pos, this.get(pos));
			}
		}
	}
	return grid;
};

window.onload = start;