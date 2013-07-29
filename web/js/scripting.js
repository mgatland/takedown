var Scripting = function (flags) {
	var triggers = [];


	// flag1, flag2, rule
	// The rule is a 2 character string that specifies the required state of each flag
	// + means it must be true, - means it must be false, ? means it is not checked
	// e.g. "10, 20, +-" means "flag 10 must be true, flag 20 must be false"
	var flagCondition = function (cond) {
		var matches = 0;
		for (var i = 0; i < 2; i++) {
			var flagState = flags[cond.val[i]] ? true : false;
			switch (cond.val[2][i]) {
				case "+":
					if (flagState == true ) matches++;
					break;
				case "-":
					if (flagState == false) matches++;
					break;
				case "?":
					matches++; //anything
					break;
				default:
					console.log("Error in flagCondition: " + cond.val[2]);
					console.log(cond);
			}
		}
		return (matches == 2);
	}

	var checkAllTriggers = function (scriptEvent, world) {
		triggers.forEach(function (trigger, triggerIndex) {
			if (!trigger.live) return;
			var condsTrue = [];
			trigger.cond.forEach(function (cond, i) {
				condsTrue[i] = checkCondition(cond, scriptEvent, world);
			});
			if (trigger.actWhen === "and") {
				if (condsTrue[0] && condsTrue[1]) fireTrigger(trigger, triggerIndex, world);
			}
		});
	}

	var checkCondition = function (cond, scriptEvent, world) {
		var result;
		switch (cond.type) {
			case "true":
				result = true;
				break;
			case "newlev":
				result = (scriptEvent === "newlev");
				break;
			case "win":
				result = (scriptEvent === "win");
				break;
			case "flag":
				result = flagCondition(cond);
				break;
			case "kills":
				result = (world.kills >= toInt(cond.val[0]));
				break;
			case "playerxy":
				result = (world.p.pos.x == toInt(cond.val[0])
					&& world.p.pos.y == toInt(cond.val[1]));
				break;
			default:
				console.log("Unsupported condition " + cond.type);
		}
		return result;
	}

	var processAction = function (action, world) {
		switch (action.type) {
			case "mistxt":
				console.log("Update mission text...");
				break;
			case "flag_setval":
				var flagNumber = toInt(action.val[0]);
				var flagValue = toInt(action.val[1]);
				flags[flagNumber] = flagValue;
				break;
			case "briefing":
				var briefing = createBriefing(action.val);
				world.setBriefing(briefing);
				break;
			case "text":
				world.audio.play(world.audio.msg);
				action.val.forEach(function (string) {
					if (string && string.length > 0) world.addMessage(string);
				});
				break;
			case "endmission":
				var timeDelay = parseInt(action.val[0]);
				//ignore the other parameters
				world.endMission(timeDelay);
				break;
			case "dec":
				var decNum = toInt(action.val[0]);
				var rawDecValue = toInt(action.val[1]);
				var decValue = rawDecValue == 1 ? true: false;
				//-1 is meant to toggle but it's not used in the main campaign so i don't support it
				if (rawDecValue != 0 && rawDecValue != 1) console.log("WARNING: we do not support a 'dec' action with a value of " + rawDecValue);
				world.decorations[decNum].live = decValue;
				break;
			default:
				console.log("Firing unknown action " + action.type);
		}
	}

	var fireTrigger = function (trigger, i, world) {
		console.log("Firing trigger (" + trigger.cond[0].type + "," + trigger.cond[1].type + ")");
		trigger.act.forEach(function (action) {
			processAction(action, world);
		});
		if (!trigger.repeating) trigger.live = false;
	}

	this.setTriggers = function (newTriggers) {
		triggers = newTriggers;
	}

	this.newLev = function (world) {
		checkAllTriggers("newlev", world);
	}

	this.win = function (world) {
		checkAllTriggers("win", world);
	}

	this.update = function (world) {
		checkAllTriggers("tick", world);
	}
}