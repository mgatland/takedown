"use strict";

function CampaignLoader() {

  var lines = [];

  var findSection = function (startTag, lines, i) {
    var skipped = 0;
    while (lines[i].lastIndexOf(startTag, 0) !== 0) {
      i++;
      skipped++;
    }
    console.log("Skipped " + skipped + " lines");
    console.log("Section " + startTag);
    return i+1;
  }

  this.loadMission = function (level) {
    var mission = 0;
    var i = 0;
    while (i < lines.length) {
      if (lines[i].lastIndexOf("[MISSION", 0) === 0) {
        mission++;
        i++;
        console.log("Looking for level " + level + ", found " + mission);
        if (level != mission) continue;
        console.log("Level " + level);
        console.log("Size: " + lines[i])
        var sizes = CSVToArray(lines[i]); //size string e.g. "23,45"
        var width = parseInt(sizes[0], 10) + 1; //yep, it's inclusive.
        var height = parseInt(sizes[1], 10) + 1; //
        i++;
        //load all the terrain
        console.log("Terrain: ");
        var terrain = {};
        for (var row = 0; row < height; row++) {
          var line = lines[i].substring(1); //cut off leading quotation mark. The quotation mark at the end must also be ignored.
          i++;
          console.log(line);
          for (var col = 0; col < width; col++) {
            var tile = line.substring(col,col+1);
            switch (tile) {
              case ' ':
              case '*':
              case '~':
              case '!':
              case '`':
                terrain[col+":"+row] = 0;
                //ground
                break;
              default:
              var obsticleType = tile.charCodeAt(0) - 48; //a becomes 1?
              terrain[col+":"+row] = obsticleType;
            }
          }
        }
        console.log("ground type: " + lines[i]);
        var groundType = parseInt(lines[i]);
        i++;
        var unusedBlankLine = lines[i];
        i++;
        console.log("player position: " + lines[i]);
        var pPos = CSVToArray(lines[i]);
        i++;
        var pX = parseInt(pPos[0]);
        var pY = parseInt(pPos[1]);
        var pFace = parseInt(pPos[2]);

        var enemies = [];
        i = findSection("[enemy]", lines, i);
        //loading enemes:
        //"[]" ends the section
        while (lines[i] != "[]") {
          if (lines.length === 0 || lines[i].substring(0,1) === "'") {
            i++;
            continue; //ignore comments and blanks
          }
          var enemyLine = CSVToArray(lines[i]); //values are: index, x, y, type, state, goaldie, tag
          var x = parseInt(enemyLine[1], 10);
          var y = parseInt(enemyLine[2], 10);
          var type = parseInt(enemyLine[3], 10);
          var state = enemyLine[4];
          enemies.push({x:x, y:y, type:type, state: state});
          console.log(enemies[enemies.length - 1]);
          i++;
        }

        i = findSection("[trigger]", lines, i);

        var decs = [];
        i = findSection("[misc]", lines, i);
        while (lines[i] != "[]") {
          if (lines.length === 0 || lines[i].substring(0,1) === "'") {
            i++;
            continue; //ignore comments and blanks
          }
          var decLine = CSVToArray(lines[i]);
          decs.push({x: decLine[1], y:decLine[2], type:decLine[3], live:decLine[4] >= 0});
          i++;
        }

        i = findSection("[brief]", lines, i);

        //now initialize the world and call the callback
        var world = new World(createGrid(width, height));
        world.map.forEach(function (pos, value) {
          var tile = terrain[pos.x + ":" + pos.y];
          world.map.set(pos, tile);
        });
        world.createPlayer(new Pos(pX, pY), pFace);
        enemies.forEach(function (e) {
          world.createEnemy(new Pos(e.x, e.y), e.type, e.state);
        });
        decs.forEach(function (d) {
          world.createDecoration(new Pos(d.x, d.y), d.type, d.live ? true : false);
        });
        return world;
      } else {
        i++; //ignore all other lines.
      }
    }
  }

  this.load = function ( url, callback ) {
    var req = new XMLHttpRequest();
    req.open('GET', url);
    req.onreadystatechange = function() {
      if (req.readyState == 4) {
        if (req.status == 200) {
          //normalise different OS line endings
          var responseText = req.responseText.replace(/(\r\n|\n|\r)/gm, "\n");
          lines = responseText.split(/\n/g);
          callback();
        } else {
          throw "Error loading file " + url + ", request status " + req.status;
        }
      }
    };
    req.send();
  }


  //from http://stackoverflow.com/a/1293163
  // This will parse a delimited string into an array
  //The default delimiter is the comma, but this
  // can be overriden in the second argument.
  function CSVToArray( strData, strDelimiter ){
    // Check to see if the delimiter is defined. If not,
    // then default to comma.
    strDelimiter = (strDelimiter || ",");

    // Create a regular expression to parse the CSV values.
    var objPattern = new RegExp(
      (
        // Delimiters.
        "(\\" + strDelimiter + "|\\r?\\n|\\r|^)" +

        // Quoted fields.
        "(?:\"([^\"]*(?:\"\"[^\"]*)*)\"|" +

        // Standard fields.
        "([^\"\\" + strDelimiter + "\\r\\n]*))"
      ),
      "gi"
      );


    // Create an array to hold our data.
    var arrData = [];

    // Create an array to hold our individual pattern
    // matching groups.
    var arrMatches = null;


    // Keep looping over the regular expression matches
    // until we can no longer find a match.
    while (arrMatches = objPattern.exec( strData )){

      // Get the delimiter that was found.
      var strMatchedDelimiter = arrMatches[ 1 ];

      // Check to see if the given delimiter has a length
      // (is not the start of string) and if it matches
      // field delimiter. If id does not, then we know
      // that this delimiter is a row delimiter.
      if (
        strMatchedDelimiter.length &&
        (strMatchedDelimiter != strDelimiter)
        ){

        // We have reached a new row of data

      }


      // Now that we have our delimiter out of the way,
      // let's check to see which kind of value we
      // captured (quoted or unquoted).
      if (arrMatches[ 2 ]){

        // We found a quoted value. When we capture
        // this value, unescape any double quotes.
        var strMatchedValue = arrMatches[ 2 ].replace(
          new RegExp( "\"\"", "g" ),
          "\""
          );

      } else {

        // We found a non-quoted value.
        var strMatchedValue = arrMatches[ 3 ];

      }


      // Now that we have our value string, let's add
      // it to the data array.
      arrData.push( strMatchedValue );
    }

    // Return the parsed data.
    return( arrData );
  }

}
