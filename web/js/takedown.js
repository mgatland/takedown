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
dir.random = function () {
	switch (Math.floor(Math.random() * 4)) {
		case 0: return dir.UP;
		case 1: return dir.RIGHT;
		case 2: return dir.DOWN;
		case 3: return dir.LEFT;
	}
};

dir.adjacentDirs = function (face) {
	switch (face) {
		case dir.UP:
		case dir.DOWN: return [dir.LEFT, dir.RIGHT];
		case dir.LEFT:
		case dir.RIGHT: return [dir.UP, dir.DOWN];
	}
	console.log("error: finding adjacent dirs for unnatural dir " + face);
	return [dir.UP, dir.DOWN, dir.lEFT, dir.RIGHT];
}

dir.name = function (face) {
	switch (face) {
		case 1: return "UP";
		case 2: return "RIGHT";
		case 3: return "DOWN";
		case 4: return "LEFT";
		case 0: return "NONE";
	}
	return "ERROR: dir " + face;
}

//AI globals to un-globalify
var maxCanSee = 25 * 2;
var suspicionBehindMulti = 0.2;

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

	this.dirOnPathTowards = function (other, map) {
		return this.dirOnPathTowardsAvoiding(other, map, null);
	}

	//next step in the walkable path from here to there
	this.dirOnPathTowardsAvoiding = function(other, map, avoidPos, dangerDistance) {
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
				if (map.canMove(next) && (avoidPos == null || avoidPos.trueDistanceTo(next) > dangerDistance)) {
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

	this.moveInDir = function (face, distance) {
		if (face === dir.UP) this.y -= distance;
		if (face === dir.RIGHT) this.x += distance;
		if (face === dir.DOWN) this.y += distance;
		if (face === dir.LEFT) this.x -= distance;
		return this; //for chaining
	}

	//warning: returns a non-integer //TODO: consider returning an int
	this.trueDistanceTo = function(other) {
		return Math.sqrt( 
			(this.x-other.x)*(this.x-other.x) +
			(this.y-other.y)*(this.y-other.y)  
			);
	}

	this.toString = function () {
		return "(" + this.x + "," + this.y + ")";
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

	this.setOwner = function () {}; //ignore
	this.update = function () {}; //ignore
	this.setState = function () {}; //ignore
}

/* AT States:

    Waiting
       |
       |
       V
	Pursuing  <-> Fighting <-> Surrounding

When combat is over, any combat state transitions to Waiting
If line of sight is lost, any combat state transitions to Pursuing

*/

var Waiting = function () {
	this.name = "Waiting";
	this.update = function (ai, owner, world, target) {
		if (ai.isAwareOfAnyone(world)) {
			ai.setState(new Pursuing());
		}
	}

	this.move = function (ai, world, target) {
		return dir.NONE;
	}
}

var Pursuing = function () {
	this.name = "Pursuing";
	this.update = function (ai, owner, world, target) {
		if (target === null || target.live === false) {
			ai.setState(new Waiting());
			return;
		}
		var distance = owner.pos.trueDistanceTo(target.pos);
		if (distance < owner.type.fightDistMax && ai.getCanSee(target.index) > 5) {
			ai.setState(new Fighting());
		}
	}

	this.move = function (ai, owner, world, target) {
		return owner.pos.dirOnPathTowards(target.pos, world.map);
	}
}

//must check isValid after construction
var Surrounding = function (owner, world, target) {
	this.name = "Surrounding";

	//initialize, choose which way to surround
	var dirTowards = owner.pos.dirTowards(target.pos, false);
	var dirsToTry = dir.adjacentDirs(dirTowards);
	var clearDirs = [];
	var movesAllowed = 10; //abort after 10 moves, just to avoid us getting stuck
	var distanceRequired = 4;
	dirsToTry.forEach(function (face) {
		var pos = target.pos.clone();
		var clearDistanceFromTarget = 0;
		while (clearDistanceFromTarget < distanceRequired && world.map.canMove(pos)) {
			pos.moveInDir(face, 1);
			clearDistanceFromTarget++;
		}
		if (clearDistanceFromTarget === distanceRequired) clearDirs.push(face);
	});

	var failed = (clearDirs.length === 0); //if this fialed, we will abort this state on next update

	if (!failed) {
		var bestDir = clearDirs[Math.floor(Math.random() * clearDirs.length)];
		console.log("dir: " + dir.name(bestDir));
		var destination = target.pos.clone().moveInDir(bestDir, distanceRequired);
	}

	this.isValid = function () {
		return !failed;
	}

	this.update = function (ai, owner, world, target) {
		if (owner.pos.trueDistanceTo(destination) < 3 || movesAllowed <= 0) {
			ai.setState(new Fighting());
			return;
		}
		if (target === null || target.live === false) {
			ai.setState(new Waiting());
			return;
		}
	};

	this.move = function (ai, owner, world, target) {
		movesAllowed--;
		return owner.pos.dirOnPathTowardsAvoiding(destination, world.map, target.pos, 2);
	};
}

var Fighting = function () {
	var minMovesUntilTactics = 5;
	var movesUntilTactics = Math.floor(Math.random() * minMovesUntilTactics + minMovesUntilTactics);
	this.name = "Fighting";
	this.update = function (ai, owner, world, target) {
		if (target === null || target.live === false) {
			ai.setState(new Waiting());
			return;
		}

		var distance = owner.pos.trueDistanceTo(target.pos);
		if (distance > owner.type.fightDistMax + 4 || ai.getCanSee(target.index) < 1) {
			ai.setState(new Pursuing());
			return;
		}

		if (movesUntilTactics <= 0) {
			var tactic = new Surrounding(owner, world, target);
			if (tactic.isValid()) {
				ai.setState(tactic);
				return;
			} else {
				movesUntilTactics = minMovesUntilTactics * 2;
			}
		}
	};

	//We might move randomly in either of the given directions,
	//Or we might decide to close the difference and try to get in line with our opponent
	//if difference is > 0, that means dirUp will close the gap.
	//if difference is < 0, that means dirDown will close the gap.
	var dodgeMove = function (difference, dirUp, dirDown) {
		if (Math.random() > 0.75 || difference == 0) { //move randomly
			return (Math.random() > 0.5) ? dirUp : dirDown;
		} else { //or move towards the firing line
			return (difference > 0) ? dirUp : dirDown;
		}
	};

	this.move = function (ai, owner, world, target) {
		movesUntilTactics--;
		var dX = Math.abs(owner.pos.x - target.pos.x);
		var dY = Math.abs(owner.pos.y - target.pos.y);
		if (dX == dY) return dir.random();
		if (dX > dY) return dodgeMove(owner.pos.y - target.pos.y, dir.UP, dir.DOWN);
		return dodgeMove(owner.pos.x - target.pos.x, dir.LEFT, dir.RIGHT);
	};
}

var AI = function () {
	var owner = null; //must be set by Person

	var iCanSee = []; //how long we've had line of sight to player i
	var suspicion = []; //how much we suspect player i exists
	var aware = []; // Awareness type

	var state = null; //must be set by Person

	this.setState = function (newState) {
		console.log("new state: " + newState.name);
		state = newState;
	}

	this.setOwner = function (o) {
		if (owner !== null) throw "Error, setting AI owner twice";
		owner = o;
	}

	//methods used by AI states

	this.isAwareOfAnyone = function (world) {
		var anyAware = false;
		var myEnemies = world.enemies.filter(function (e, i) { return e.live === true && e.team != owner.team});
		myEnemies.forEach(function (e) {
			var i = e.index;
			if (aware[i] === true) anyAware = true;
		});
		return anyAware;
	}

	this.getCanSee = function (i) {
		return iCanSee[i];
	}

	// end of

	var addSuspicion = function(amount, i) {
		suspicion[i] += amount;
		if (suspicion[i] > 300) {
			aware[i] = true;
		}
	}

	var reduceSuspicion = function(amount, i) {
		suspicion[i] -= amount;
		if (suspicion[i] < 0) suspicion[i] = 0;
	}

	var awareOf = function (whoIndex) {
		return aware[whoIndex];
	}

	this.update = function (world) {

		//for each enemy who's not me, and who's not on my team...
		var myEnemies = world.enemies.filter(function (e, i) { return e.live === true && e.team != owner.team});
		myEnemies.forEach(function (e) {
			var i = e.index;
			//TODO: perf: only initialize once, then never do this check again.
			if (iCanSee[i] === undefined) {
				iCanSee[i] = 0;
				suspicion[i] = 0;
				aware[i] = false;
			}

			//update canSee
			var canSeeNow = world.map.canSee(owner.pos, e.pos);
			if (canSeeNow) {
				if (iCanSee[i] < maxCanSee) iCanSee[i] += 1;
			} else {
				if (iCanSee[i] > 0) iCanSee[i] -= 1;
			}

			//update suspicion, unless we're already aware of them.
			if (aware[i] === false) {
				if (canSeeNow) {
					var dist = owner.pos.trueDistanceTo(e.pos);
					var suspicionPoints = Math.max(30 - dist * 3, 5);
					if (owner.facingAwayFrom(e.pos)) suspicionPoints *= suspicionBehindMulti;
					addSuspicion(Math.floor(suspicionPoints), i);
				} else {
					reduceSuspicion(1, i);
				}
			}
		});

		//for every shot
		world.shots.forEach(function (s) {
			if (s.ownerIndex === owner.index) return;
			if (awareOf(s.ownerIndex)) return;

			var canSee = world.map.canSee(owner.pos, s.pos);
			if (canSee) {
				var dist = owner.pos.trueDistanceTo(s.pos);
				var suspicionPoints = Math.max(125 - dist * 20, 20);
				if (owner.facingAwayFrom(s.pos)) suspicionPoints *= suspicionBehindMulti;
				addSuspicion(Math.floor(suspicionPoints), s.ownerIndex);
			}
		});

		state.update(this, owner, world, world.p);
	}

	this.move = function(world) {
		var plannedMove = state.move(this, owner, world, world.p);
		
		//based on danger, we might decide not to use our planned move.
		var bestMove = 0;
		var bestScore = -999;
		var clumsy = (this.isAwareOfAnyone(world) === false) || (Math.random() * 110 > owner.type.skill);
		for (var i = 0; i <= 4; i++) {
			var movedPos = owner.pos.clone().moveInDir(i, 1);
			if (!world.map.canMove(movedPos)) continue; //can't move here
			var moveScore = 0;
			if (i === dir.NONE && i != plannedMove) moveScore += 0.5; // standing still usually beats pointless movement.
			if (i === plannedMove) moveScore += 4;
			if (!clumsy) moveScore -= world.getDangerAt(movedPos); //I usually spot danger, but occasionally forget to look

			//random variation
			moveScore += Math.random() * 1.0;
			if (moveScore > bestScore) {
				bestScore = moveScore;
				bestMove = i;
			}
		}
		if (bestMove != plannedMove) console.log("dodged!");
		return bestMove;
	}

	var NO_SHOOT = {dir: dir.NONE, mode: -1};

	this.shoot = function(world) {

		if (awareOf(world.p.index) == false) return NO_SHOOT;

		if (world.p.live === false) return NO_SHOOT;
		var shootDir = owner.pos.dirTowards(world.p.pos, false);
		if (shootDir == dir.NONE) return NO_SHOOT;

		//1. Is there a clear shot? Is there a straight or L-shaped path from me to the player?
		if (shootDir == dir.LEFT || shootDir == dir.RIGHT) {
			var startX = owner.pos.x;
			var endX = world.p.pos.x;
			var startPos = new Pos(startX, owner.pos.y);
			var midPos = new Pos(endX, owner.pos.y);
		} else {
			var startY = owner.pos.y;
			var endY = world.p.pos.y;
			var startPos = new Pos(owner.pos.x, startY);
			var midPos = new Pos(owner.pos.x, endY);
		}
		var canSee1 = world.map.canSee(startPos, midPos);
		var canSee2 = world.map.canSee(midPos, world.p.pos)
		if (!canSee1 || !canSee2) return NO_SHOOT;

		//2. Is this shot close enough? Either straight, or the player might walk sideways into it?
		var xDist = Math.abs(owner.pos.x - world.p.pos.x);
		var yDist = Math.abs(owner.pos.y - world.p.pos.y);
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

var shotTypes = [];
shotTypes[0] = {damage: 4, moveSpeed: 1, skin: 0}; //blue normal player shot
shotTypes[1] = {damage: 2, moveSpeed: 1, skin: 2}; //red tiny enemy shot
shotTypes[2] = {damage: 5, moveSpeed: 0, skin: 3}; // purple supershot
shotTypes[3] = {damage: 6, moveSpeed: 0, skin: 1}; // unused
shotTypes[4] = {damage: 2, moveSpeed: -1, skin: 2}; // instant hit enemy shot

//player
var playerType = {health: 10, shootSpeed: 14, moveSpeed: 4, skin: 0, shotType: 0, skill: 99, fightDistMax: 10, fightDistMin: 3};
//player guns:
// 0 - heatInc: 20, projType: 0, sspeed: 14
// 1 - heatInc: 35, kick: 15, projType: 2, sspeed: 22

var enemyTypes = [];
enemyTypes[1] = {health:  4, shootSpeed: 40, moveSpeed: 8, skin: 1, shotType: 1, skill: 50, fightDistMax: 7, fightDistMin: 2 }; //grunt
enemyTypes[3] = {health: 10, shootSpeed: 40, moveSpeed: 8, skin: 2, shotType: 1, skill: 50, fightDistMax: 7, fightDistMin: 2 }; //armoured
enemyTypes[5] = {health:  4, shootSpeed: 15, moveSpeed: 8, skin: 3, shotType: 1, skill: 50, fightDistMax: 7, fightDistMin: 2 }; //rapid fire
enemyTypes[7] = {health: 10, shootSpeed: 30, moveSpeed: 8, skin: 4, shotType: 0, skill: 70, fightDistMax: 9, fightDistMin: 2 }; //commando
enemyTypes[9] = {health: 12, shootSpeed: 20, moveSpeed: 4, skin: 5, shotType: 2, skill: 85, fightDistMax: 10, fightDistMin: 3}; //elite commando
enemyTypes[11] = {health: 5, shootSpeed: 20, moveSpeed: 8, skin: 6, shotType: 4, skill: 65, fightDistMax: 20, fightDistMin: 4}; //sniper

var Person = function (pos, face, ai, type) {
	this.type = type;
	this.moved = 0;
	this.face = face;
	this.shot = 0;
	this.heat = 0;
	this.maxHeat = 120;
	this.pos = pos.clone();
	this.live = true;
	this.health = type.health;
	this.ai = ai;
	this.index = null;
	ai.setOwner(this);
	ai.setState(new Waiting());
}

Person.prototype.facingAwayFrom = function (pos) {
	switch (this.face) {
		case dir.UP: return pos.y < this.pos.y;
		case dir.DOWN: return pos.y > this.pos.y;
		case dir.LEFT: return pos.x > this.pos.x;
		case dir.RIGHT: return pos.x < this.pos.x;
		case dir.NONE: return false; //weird case
	}
}

Person.prototype.update = function (world) {
	if (this.live === false) return;

	this.ai.update(world);

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
		//mode is ignored
		var shot = world.createShot(this.type.shotType, this.pos, this.face, this.team, this.index);
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


var Shot = function (typeIndex, pos, face, team, ownerIndex, world) {
	this.live = true;
	this.type = shotTypes[typeIndex];
	this.pos = pos.clone();
	this.face = face;
	this.team = team;
	this.ownerIndex = ownerIndex;
	this.moved = 0;
	world.shots.push(this);
};

Shot.prototype._checkHitPeople = function(people) {
	var that = this;
	var hit = false;
	people.forEach(function (e) {
		if (that.live === false) return; //we can only hit one person per turn
		if (e.pos.equals(that.pos) && e.live === true && e.team != that.team) {
			e.hurt(that.type.damage);
			that.live = false;
			hit = true;
		}
	});
	return hit;
}

Shot.prototype.update = function(world) {
	if (this.live === false) return;

	//We check for collisions before and after moving
	//when we implement piercing shots this will have to change - you only want to hit someone
	//if they moved into your square this frame, not if they were already there in the previous frame.
	this._checkHitPeople(world.enemies);
	if (this.live === false) return;

	if (this.moved > 0) {
		this.moved--;
	} else {
		var moved = tryMove(this, this.face, world.map);
		if (moved===false) {
			this.live = false;
		}
	}
	//we check again after moving
	this._checkHitPeople(world.enemies);
}

var World = function(map) {

	this.shots = [];
	this.enemies = [];
	this.p = null;
	this.map = map;
	var dangerMap = make2DArray(map.width, map.height, 0);

	this.createShot = function(typeIndex, pos, face, team, ownerIndex) {
		console.log("shot!");
		var shot = new Shot(typeIndex, pos, face, team, ownerIndex, this);
	}

	this.createEnemy = function (pos, type, state) {
		var e = new Person(pos, dir.random(), new AI(), enemyTypes[type]);
		e.team = 1;
		e.index = this.enemies.length;
		//set state
		this.enemies.push(e);
		return e;
	};

	this.createPlayer = function (pos, face) {
		this.p = new Person(pos, face, new PlayerAI(), playerType);
		this.p.team = 0;
		this.p.index = this.enemies.length;
		this.enemies.push(this.p);
	};

	var setDangerAt = function (pos, value) {
		if (map.isValid(pos)) {
			if (dangerMap[pos.x][pos.y] < value) {
				dangerMap[pos.x][pos.y] = value;
			}
		}
	}

	var updateDangerMap = function () {
		this.map.forEach(function (pos, value) {
			dangerMap[pos.x][pos.y] = 0;
		});
		
		//Danger around the player
		if (this.p.live === true) {
			var pos = this.p.pos;
			setDangerAt(pos.clone().moveInDir(dir.UP, 1), 2);
			setDangerAt(pos.clone().moveInDir(dir.DOWN, 1), 2);
			setDangerAt(pos.clone().moveInDir(dir.LEFT, 1), 2);
			setDangerAt(pos.clone().moveInDir(dir.RIGHT, 1), 2);

			setDangerAt(pos.clone().moveInDir(dir.UP, 2), 1);
			setDangerAt(pos.clone().moveInDir(dir.DOWN, 2), 1);
			setDangerAt(pos.clone().moveInDir(dir.LEFT, 2), 1);
			setDangerAt(pos.clone().moveInDir(dir.RIGHT, 2), 1);
		}

		//Danger in front of shots that can hurt enemies
		this.shots.forEach(function (s) {
			if (s.live === false) return;
			if (s.team === 1) return; //ignore my own shots
			var pos = s.pos.clone();
			var danger = 100;
			while (map.isValid(pos) && danger > 0) {
				setDangerAt(pos, danger);
				pos.moveInDir(s.face, 1);
				danger -= 8;
			}
		});
	};

	this.getDangerAt = function (pos) {
		if (map.isValid(pos)) {
			return dangerMap[pos.x][pos.y];
		} else {
			return 0;
		}
	}

	this.update = function () {
		var world = this;

		updateDangerMap.call(this); //ewww javascript.

		this.enemies.forEach(function(e) {
			e.update(world);
		});

		this.shots.forEach(function(shot) {
			shot.update(world);
		});
	}

	//Delete this if it remains unused
	this.getRandomPos = function () {
		var pos = null;
		while (pos === null || this.map.canMove(pos)===false) {
			var x = Math.floor(Math.random() * this.map.width);
			var y = Math.floor(Math.random() * this.map.height);
			pos = new Pos(x, y);
		}
		return pos;
	}
};

var start = function () {
	canvas = document.getElementById('gamescreen');
	ctx = canvas.getContext("2d");
	canvas.width = screen.width * screen.tileSize;
	canvas.height = screen.height * screen.tileSize;
	var keyboard = createKeyboard();

	var world = null;
	var camera = null;

	var level = 1;
	var campaignLoader = new CampaignLoader();
	campaignLoader.load("./res/01.tdm", function () {
		world = campaignLoader.loadMission(level);
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

		if (world && !world.enemies.some(function (e) {return e.live && e.team != 0;})) {
			console.log("You win!");
			level++;
			world = campaignLoader.loadMission(level);
			camera = new Camera(world.p.pos, world.map.width, world.map.height);
		}

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
	world.update();
	camera.update(world.p.pos);
};

//global...
var tryMove = function (o, face, map) {
	var movedPos = o.pos.clone().moveInDir(face, 1);
	if (map.canMove(movedPos)) {
		o.pos = movedPos;
		o.moved = o.type.moveSpeed;
		return true;
	}
	return false;
};

// Draw everything
var render = function (world, camera) {
	if (world === null) return;

	world.map.forEach(function (pos, tile) {
		if (tile === 0) {
			if (world.map.canSee(pos, world.p.pos)) {
				drawSquare(pos, "green", camera);
			} else {
				drawSquare(pos, "darkgreen", camera);
			}
		} else {
			drawSquare(pos, "grey", camera);
		}
	});

	world.shots.forEach(function (shot) {
		drawShot(shot, camera);
	});

	world.enemies.forEach(function (e) {
		drawPerson(e, camera);
	});

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

//Hacks, until we have sprites
var getPersonColor = function (skinType) {
	switch (skinType) {
		case 0: return "blue";
		//grunt, armoured, rapid, commando, elite, sniper
		case 1: return "lightgreen"; 
		case 2: return "darkgreen";
		case 3: return "orange";
		case 4: return "red";
		case 5: return "purple";
		case 6: return "darkgrey";
	}
	return "white";
}

//Hacks, until we have sprites
var getShotColor = function (skinType) {
	switch (skinType) {
		case 0: return "cyan";
		//1 is unused
		case 2: return "red"; 
		case 3: return "magenta";
	}
	return "white";
}

var drawShot = function (shot, camera) {
	var pos = shot.pos;
	var face = shot.face;
	var color = shot.live ? getShotColor(shot.type.skin) : "orange";
	ctx.fillStyle = color;
	var x = 0;
	var y = 0;
	var width = screen.tileSize / 2;
	var height = screen.tileSize / 2;
	switch (face) {
		case dir.LEFT: x = 0; y = 0; width *= 2; break;
		case dir.RIGHT: x = 0; y = 0.5; width *= 2; break;
		case dir.UP: x = 0.5; y = 0; height *= 2; break;
		case dir.DOWN: x = 0; y = 0; height *= 2; break;
	}
	ctx.fillRect((pos.x+x)*screen.tileSize - camera.xOff(), (pos.y+y)*screen.tileSize - camera.yOff(), width, height);

}

var drawPerson = function (person, camera) {
	var pos = person.pos;
	var face = person.face;
	var color = person.live ? getPersonColor(person.type.skin) : "black";
	drawSquare(pos, color, camera);
	ctx.fillStyle = "white";
	var x = 0;
	var y = 0;
	switch (face) {
		case dir.LEFT: x = 0.1; y = 0.25; break;
		case dir.RIGHT: x = 0.4; y = 0.25; break;
		case dir.UP: x = 0.25; y = 0.1; break;
		case dir.DOWN: x = 0.25; y = 0.4; break;
	}
	ctx.fillRect((pos.x+x)*screen.tileSize - camera.xOff(), (pos.y+y)*screen.tileSize - camera.yOff(), screen.tileSize/2, screen.tileSize/2);
}

var make2DArray = function (width, height, defaultValue) {
	var array = [];
	for (var i = 0; i < width; i ++) {
		array[i] = [];
		for (var j = 0; j < height; j++) {
			array[i][j] = defaultValue;
		}
	}
	return array;
}

var createGrid = function (myWidth, myHeight) {
	var terrain = make2DArray(myWidth, myHeight, 0);
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
		//handle orthoginal directions first
		if (start.x == end.x) {
			var min = Math.min(start.y, end.y);
			var max = Math.max(start.y, end.y);
			for (var i = min; i <= max; i++) {
				if (!this.canMove(new Pos(start.x, i))) return false;
			}
			return true;
		}
		if (start.y == end.y) {
			var min = Math.min(start.x, end.x);
			var max = Math.max(start.x, end.x);
			for (var i = min; i <= max; i++) {
				if (!this.canMove(new Pos(i, start.y))) return false;
			}
			return true;
		}

		//OK, it's a diagonal. Both x and y are different.

		//Trace a line from start to end.
		//sweep along the line horizontally, for every x position
		//we check each vertical strip - which may be one cell, or more
		
		//A special case when peering through the crack between corners
		//aO     Ob			a is looking at b
		//Ob     aO 		if both Os are occupied, the view is blocked.

		//swap so X is always increasing.
		if (end.x < start.x) {
			var temp = end;
			end = start;
			start = temp;
		}

		var dX = (end.x - start.x); //always positive
		var dY = (end.y - start.y);
		var yRate = dY / dX; //when we add 1 to x, we must add yRate * 1 to y.

		var backwards = dY < 0;

		var x = start.x + 0.5;
		var y = start.y + 0.5;
		var firstHalf = null; //the value of the first half of the half-check. We need either side to be true to continue.

		while (x <= end.x) { //for each vertical strip of squares that the LOS passes through
			//console.log("x: " + x + ", y: " + y);

			var xCell = Math.floor(x);
			var top1 = Math.floor(y);
			var topIsCorner1 = (y===Math.floor(y));

			//the first and last step are half-cells, because the start and end are in the centre of a cell
			var xDist = (x < start.x + 1 || x == end.x) ? 0.5 : 1.0;
			y += yRate * xDist;

			var bottom1 = Math.floor(y);
			var bottomIsCorner1 = (y===Math.floor(y));

			//console.log("y from " + top1 + " to " + bottom1);

			//for simplicity, we swap so each strip is always done y-low to y-high
			var top = backwards ? bottom1 : top1;
			var bottom = backwards ? top1 : bottom1;
			var topIsCorner = backwards ? bottomIsCorner1 : topIsCorner1;
			var bottomIsCorner = backwards ? topIsCorner1 : bottomIsCorner1;

			if (topIsCorner) {
				//console.log("(" + xCell + "," + (top-1) + ") top");
				var thisHalf = (this.canMove(new Pos(xCell, top-1)));
				if (firstHalf === null) {
					firstHalf = thisHalf;
				} else {
					if (!firstHalf && !thisHalf) return false; //if both corners blocked our view
					firstHalf = null; //we saw past this pair of corners
				}
			}

			if (bottomIsCorner) bottom--;

			for (var yCell = top; yCell <= bottom; yCell++) {
				//console.log(xCell + "," + yCell);
				if (!this.canMove(new Pos(xCell, yCell))) return false;
			}

			if (bottomIsCorner) {
				//console.log("(" + xCell + "," + bottom+1 + ") bottom");
				var thisHalf = (this.canMove(new Pos(xCell, bottom+1)));
				if (firstHalf === null) {
					firstHalf = thisHalf;
				} else {
					if (!firstHalf && !thisHalf) return false; //if both corners blocked our view
					firstHalf = null; //we saw past this pair of corners
				}
			}

			x += xDist;
		}
		return true;
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

if (typeof tests != "undefined") {
	window.onload = tests;
} else {
	window.onload = start;
}