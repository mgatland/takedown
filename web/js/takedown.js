"use strict";

//so many globals
var width = 25;
var height = 17;
var tileSize = 32;

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

var Person = function () {
	this.moved = 0;
	this.moved = 0;
	this.face = 0;
	this.moveSpeed = 4;
	this.shot = 0;
	this.heat = 0;
	this.maxHeat = 120;
	this.pos = {};
	this.pos.x = 5;
	this.pos.y = 5;
}

Person.prototype.update = function (world, face, firing, fireMode) {
	if (this.moved > 0) {
		this.moved--;
	} else {
		if (face > 0) {
			tryMove(this, face, world.map);
		}
	}
	if (face > 0) this.face = face;

	if (this.shot > 0) {
		this.shot--;
	} else {
		if (firing) {
			this.fire(fireMode, world);
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


var createPlayer = function () {
	var p = new Person();
	return p;
};

var createWorld = function() {

	var world = {};
	world.shots = [];
	world.enemies = [];

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
	}

	world.createShot = function(pos, face, shotType) {
		console.log("shot!");
		var shot = {};
		shot.live = true;
		shot.pos = { x: pos.x, y:pos.y};
		shot.face = face;
		shot.type = shotType;
		shot.moved = 0;
		shot.moveSpeed = 1;
		world.shots.push(shot);
		shot.update = shotUpdate;
	}

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
	var p = createPlayer();
	
	window.setInterval(function () {
		update(world, keyboard, p);
		render(world, p);
	}, 40);
};

var update = function (world, keyboard, p) {
	var face = 0;
	if (keyboard.isKeyDown(KeyEvent.DOM_VK_UP)) face = UP;
	if (keyboard.isKeyDown(KeyEvent.DOM_VK_RIGHT)) face = RIGHT;
	if (keyboard.isKeyDown(KeyEvent.DOM_VK_DOWN)) face = DOWN;
	if (keyboard.isKeyDown(KeyEvent.DOM_VK_LEFT)) face = LEFT;

	var firing = false;
	var fireMode = 0;
	if (keyboard.isKeyDown(KeyEvent.DOM_VK_M)) {
		fireMode = 0;
		firing = true;
	} else if (keyboard.isKeyDown(KeyEvent.DOM_VK_N)) {
		fireMode = 1;
		firing = true;
	}

	p.update(world, face, firing, fireMode);
	world.shots.forEach(function(shot) {
		shot.update(world);
	});
};

//global...
var tryMove = function (o, face, map) {
	var x = o.pos.x;
	var y = o.pos.y;
	if (face === UP) y--;
	if (face === RIGHT) x++;
	if (face === DOWN) y++;
	if (face === LEFT) x--;
	if (map.canMove(x,y)) {
		o.pos.x = x;
		o.pos.y = y;
		o.moved = o.moveSpeed;
		return true;
	}
	return false;
};

// Draw everything
var render = function (world, p) {

	world.map.forEach(function (pos, tile) {
		drawSquare(pos, "green");
	});

	drawSquare(p.pos, "blue");

	world.shots.forEach(function (shot) {
		if (shot.live === true) {
			drawSquare(shot.pos, "red");
		} else {
			drawSquare(shot.pos, "orange");
		}
				
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

	grid.canMove = function (x, y) {
		if (this.isValid(x,y)) return true;
		return false;
	}

	grid.isValid = function (x, y) {
		if (x < 0 || x >= width) {
			return false;
		}
		if (y < 0 || y >= height) {
			return false;	
		}
		return true;
	}

	grid.get = function (x, y) {
		if (!this.isValid(x, y)) {
			return 0;
		}
		return terrain[x][y]; 
	}; 

	grid.set = function (x, y, value) {
		if (!this.isValid(x, y)) {
			return;
		}
		terrain[x][y] = value;
	}

	grid.forEach = function (func) {
		for (var i = 0; i < width; i ++) {
			for (var j = 0; j < height; j++) {
				func({x:i, y:j}, this.get(i, j));
			}
		}
	}
	return grid;
};

window.onload = start;