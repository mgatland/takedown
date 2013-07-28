"use strict";

//global
if (typeof KeyEvent == "undefined") {
    var KeyEvent = {
        DOM_VK_RETURN: 13,
        DOM_VK_ENTER: 14,
        DOM_VK_SPACE: 32,
        DOM_VK_SHIFT: 16,

        DOM_VK_LEFT: 37,
        DOM_VK_UP: 38,
        DOM_VK_RIGHT: 39,
        DOM_VK_DOWN: 40,

        DOM_VK_W: 87,
        DOM_VK_A: 65,
        DOM_VK_S: 83,
        DOM_VK_D: 68
    }
}

function createKeyboard() {

    var keyboard = {};
    var keysDown = {};

    window.addEventListener("keydown", function (e) {
        keysDown[e.keyCode] = true;
        switch(e.keyCode) {
            case KeyEvent.DOM_VK_DOWN:
            case KeyEvent.DOM_VK_UP:
            case KeyEvent.DOM_VK_RIGHT:
            case KeyEvent.DOM_VK_LEFT:
            e.preventDefault();
            break;
        }
    }, false);
    window.addEventListener("keyup", function (e) {
        delete keysDown[e.keyCode];
    }, false);

    keyboard.isKeyDown = function (keyCode) {
        return keysDown[keyCode];
    }
    return keyboard;
}