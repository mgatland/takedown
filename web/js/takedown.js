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

var createPlayer = function () {
	var p = {};
	p.moved = 0;
	p.face = 0;
	p.moveSpeed = 4;
	p.shot = 0;
	p.heat = 0;
	p.maxHeat = 120;

	p.pos = {};
	p.pos.x = 5;
	p.pos.y = 5;

	p.update = function (world, face, firing, fireMode) {
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

		if (p.heat > 0) {
			p.heat -= 0.5; //TODO: double all heat values and make this 1
			if (p.heat > p.maxHeat) {
				p.heat = p.maxHeat;
			}
		}
	}

	//refire rate already checked, but heat not checked
	p.fire = function (mode, world) {
		if (this.heat >= 100) {
			p.shot = 10;
			audio.play("overheat");
		} else {
			var shotType = mode; //use player gun
			var shot = world.createShot(p.pos, p.face, shotType);
			if (shot !== null) {
				//set up shot stealth, special
			}
			p.heat += heatOnFiring;
			p.shot = refireRate;
			if (p.moved < gunKick) {
				p.moved = gunKick;
			}
		}
	}

	return p;
};

var createWorld = function() {

	var world = {};
	world.shots = [];

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

	//background fill
	ctx.fillStyle = "#ff00ff";
	ctx.fillRect(0,0, width*tileSize, height*tileSize);
	
	world.map.forEach(function (x, y, tile) {
		ctx.fillStyle = "green";
		ctx.fillRect(x*tileSize, y * tileSize, tileSize, tileSize);
	});

	ctx.fillStyle = "blue";
	ctx.fillRect(p.pos.x*tileSize, p.pos.y * tileSize, tileSize, tileSize);

	world.shots.forEach(function (shot) {
		if (shot.live === true) {
			ctx.fillStyle = "red";
		} else {
			ctx.fillStyle = "orange";
		}
		ctx.fillRect(shot.pos.x*tileSize, shot.pos.y * tileSize, tileSize, tileSize);		
	});
};

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
				func(i, j, this.get(i, j));
			}
		}
	}
	return grid;
};

window.onload = start;