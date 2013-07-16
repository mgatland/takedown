"use strict";

function CampaignLoader() {

  var parseMissions = function (lines, callback) {
    var mission = 0;
    for (var i = 0; i < lines.length; i++) {
      if (lines[i].lastIndexOf("[MISSION", 0) === 0) {
        mission++;
        i++;
        console.log("Size: " + lines[i])
        var sizes = lines[i].split(","); //size string e.g. "23,45"
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
        var pPos = lines[i].split(",");
        i++;
        var pX = parseInt(pPos[0]);
        var pY = parseInt(pPos[1]);
        var pFace = parseInt(pPos[2]);

        //now load [enemy], [trigger], [misc], [brief]
        // ...


        //now initialize the world and call the callback  
        var world = createWorld(createGrid(width, height));
        world.map.forEach(function (pos, value) {
          var tile = terrain[pos.x + ":" + pos.y];
          world.map.set(pos, tile);
        });
        world.createPlayer(new Pos(pX, pY), pFace);
        world.createEnemy();
        callback(world);
        return; //no further processing.
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
          var lines = req.responseText.split(/\n/g);
          parseMissions(lines, callback);
        } else {
          throw "Error loading file " + url + ", request status " + req.status;
        }
      }
    };
    req.send();
  }  
}
