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
				if (condsTrue[0] && condsTrue[1]) fireTrigger(trigger, triggerIndex);
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
				result = (world.kills >= parseInt(cond.val[0], 10));
				break;
			case "playerxy":
				result = (world.p.pos.x == parseInt(cond.val[0], 10)
					&& world.p.pos.x == parseInt(cond.val[1], 10));
				break;
			default:
				console.log("Unsupported condition " + cond.type);
		}
		return result;
	}

	var processAction = function (action) {
		switch (action.type) {
			case "mistxt":
				console.log("Update mission text...");
				break;
			case "flag_setval":
				var flagNumber = parseInt(action.val[0], 10);
				var flagValue = parseInt(action.val[1], 10);
				flags[flagNumber] = flagValue;
				break;
			default:
				console.log("Firing unknown action " + action.type);
		}
	}

	var fireTrigger = function (trigger, i) {
		console.log("Firing trigger");
		trigger.act.forEach(function (action) {
			processAction(action);
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