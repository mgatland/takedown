"use strict";

//mostly from http://www.html5rocks.com/en/tutorials/webaudio/intro/
function createAudio() {
	var audio = {};
	var music = null;

	var init = function () {
	  try {
	    // Fix up for prefixing
	    window.AudioContext = window.AudioContext||window.webkitAudioContext;
	    return new AudioContext();
	  }
	  catch(e) {
	    console.log('Web Audio API is not supported in this browser');
	    console.log(e.stack);
	  }
	};

	function playSound(set, index, loop, volume) {
	  var buffer;
	  if (set.length === 1) {
	  	buffer = set[0];
	  } else if (index === undefined || index === null) {
	  	buffer = set[Math.floor(Math.random() * set.length)];
	  } else {
	  	buffer = set[index];
	  }
	  if (buffer === undefined) {
	  	console.log("Error: attempt to play sound which hasn't loaded");
	  	return;
	  }

	  var source = context.createBufferSource();
	  source.buffer = buffer;
	  if (volume) {
	  	//add a volume node
	  	var volumeNode = context.createGain();
	  	source.connect(volumeNode);
	  	volumeNode.connect(context.destination);
	  	volumeNode.gain.value = volume;
	  } else {
	  	source.connect(context.destination);
	  }

	  if (loop) source.loop = true;
	  source.start(0);
	  return source;
	}

	var context = init();

    audio.load = function (callback) {

    	var soundsToLoad = 0;

    	var checkIfAllHaveLoaded = function () {
    		if (soundsToLoad == 0) {
				callback();
    		}
    	};

		var onLoadError = function () {
			console.log("Error loading sound");
			soundsToLoad--;
			checkIfAllHaveLoaded();
		}

		var loadSound = function (name, index, url) {
		  soundsToLoad++;
		  var request = new XMLHttpRequest();
		  request.open('GET', url, true);
		  request.responseType = 'arraybuffer';
		  // Decode asynchronously
		  request.onload = function() {
		    context.decodeAudioData(request.response, function(buffer) {
		      if (audio[name] == undefined) audio[name] = [];
		      audio[name][index] = buffer;
		      soundsToLoad--;
		      checkIfAllHaveLoaded();
		    }, onLoadError);
		  }
		  request.send();
		}

		for (var i = 0; i < 5; i++) {
			loadSound("shot", i, "res/snd/shot" + i + ".wav");
		}
		for (var i = 0; i < 2; i++) {
			loadSound("thud", i, "res/snd/thud" + i + ".wav");
		}
		for (var i = 0; i < 4; i++) {
			loadSound("explosion", i, "res/snd/exp" + i + ".wav");
		}
		loadSound("dead", 0, "res/snd/dead0.wav");
		loadSound("overheat", 0, "res/snd/overheat0.wav");

		//music0 is normal background music
		//music1 is the lose level sfx
		//music2 is 'win level'
		//music3 is danger
		//music4 is extreme danger
		for (var i = 0; i < 5; i++) {
			loadSound("music", i, "res/snd/music" + i + ".ogg");
		}

		//voices
		for (var i = 0; i < 2; i++) {
			loadSound("seen", i, "res/snd/seen" + i + ".wav");
		}

    };

	audio.play = function (set, index) {
		playSound(set, index);
	};

	audio.playVoice = function (set, index) {
		playSound(set, index);
	}

	audio.playMusic = function (set, index) {
		this.stopMusic();
		music = playSound(set, index, true, 0.5);
	};

	audio.stopMusic = function () {
		if (music != null) {
			music.stop(0);
			music = null;
		}
	}

	return audio;
};