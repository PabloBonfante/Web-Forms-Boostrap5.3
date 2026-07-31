'use strict';

var _typeof = typeof Symbol === "function" && typeof Symbol.iterator === "symbol" ? function (obj) { return typeof obj; } : function (obj) { return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; };

function _defineProperty(obj, key, value) { if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }

(function (factory) {
    var global = Function('return this')() || (0, eval)('this');
    if (typeof define === 'function' && define.amd) {
        define(['jquery'], function ($) {
            return factory($, global);
        });
    } else if ((typeof exports === 'undefined' ? 'undefined' : _typeof(exports)) === 'object') {
        module.exports = factory(require('jquery'), global);
    } else {
        global.PatternLock = factory(global.jQuery, global);
    }
})(function ($, window) {
    var _scrollKeys;

    var svgns = 'http://www.w3.org/2000/svg';
    var moveEvent = 'touchmove mousemove';

    var scrollKeys = (_scrollKeys = {
        37: true, // left
        38: true, // up
        39: true, // right
        40: true, // down
        32: true
    }, _defineProperty(_scrollKeys, '38', true), _defineProperty(_scrollKeys, 34, true), _defineProperty(_scrollKeys, 35, true), _defineProperty(_scrollKeys, 36, true), _scrollKeys);

    function vibrate() {
        navigator.vibrate = navigator.vibrate || navigator.webkitVibrate || navigator.mozVibrate || navigator.msVibrate;
        if (navigator.vibrate) {
            window.navigator.vibrate(25);
        }
    }

    function PatternLock(element, options) {
        var svg = $(element);
        var self = this;
        var root = svg[0];
        var dots = svg.find('.lock-dots circle');
        var lines = svg.find('.lock-lines');
        var actives = svg.find('.lock-actives');
        var pt = root.createSVGPoint();
        var code = [];
        var currentline = void 0;
        var currenthandler = void 0;

        options = Object.assign(PatternLock.defaults, options || {});

        svg.on('touchstart mousedown', function (e) {
            clear();
            e.preventDefault();
            disableScroll();
            svg.on(moveEvent, discoverDot);
            var endEvent = e.type == 'touchstart' ? 'touchend' : 'mouseup';
            $(document).one(endEvent, function (e) {
                end();
            });
        });

        // Exported methods
        Object.assign(this, {
            clear: clear,
            success: success,
            error: error,
            getPattern: getPattern,
            setPattern: setPattern
        });

        function success() {
            svg.removeClass('error');
            svg.addClass('success');
        }

        function error() {
            svg.removeClass('success');
            svg.addClass('error');
        }

        function getPattern() {
            return parseInt(code.map(function (i) {
                return dots.index(i) + 1;
            }).join(''));
        }

        function end() {
            enableScroll();
            stopTrack(currentline);
            currentline && currentline.remove();
            svg.off(moveEvent, discoverDot);
            var val = options.onPattern.call(self, getPattern());
            if (val === true) {
                success();
            } else if (val === false) {
                error();
            }
        }

        function clear() {
            code = [];
            currentline = undefined;
            currenthandler = undefined;
            svg.removeClass('success error');
            lines.empty();
            actives.empty();
        }

        function preventDefault(e) {
            e = e || window.event;
            if (e.preventDefault) e.preventDefault();
            e.returnValue = false;
        }

        function preventDefaultForScrollKeys(e) {
            if (scrollKeys[e.keyCode]) {
                preventDefault(e);
                return false;
            }
        }

        function disableScroll() {
            if (window.addEventListener)
                window.addEventListener('DOMMouseScroll', preventDefault, false);
            window.onwheel = preventDefault;
            window.onmousewheel = document.onmousewheel = preventDefault;
            window.ontouchmove = preventDefault;
            document.onkeydown = preventDefaultForScrollKeys;
        }

        function enableScroll() {
            if (window.removeEventListener) window.removeEventListener('DOMMouseScroll', preventDefault, false);
            window.onmousewheel = document.onmousewheel = null;
            window.onwheel = null;
            window.ontouchmove = null;
            document.onkeydown = null;
        }

        function isUsed(target) {
            for (var i = 0; i < code.length; i++) {
                if (code[i] === target) {
                    return true;
                }
            }
            return false;
        }

        function isAvailable(target) {
            for (var i = 0; i < dots.length; i++) {
                if (dots[i] === target) {
                    return true;
                }
            }
            return false;
        }

        function updateLine(line) {
            return function (e) {
                e.preventDefault();
                if (currentline !== line) return;
                var pos = svgPosition(e.target, e);
                line.setAttribute('x2', pos.x);
                line.setAttribute('y2', pos.y);
                return false;
            };
        }

        function discoverDot(e, target) {
            if (!target) {
                var _getMousePos = getMousePos(e),
                    x = _getMousePos.x,
                    y = _getMousePos.y;

                target = document.elementFromPoint(x, y);
            }
            var cx = target.getAttribute('cx');
            var cy = target.getAttribute('cy');
            if (isAvailable(target) && !isUsed(target)) {
                stopTrack(currentline, target);
                currentline = beginTrack(target);
            }
        }

        function stopTrack(line, target) {
            if (line === undefined) return;
            if (currenthandler) {
                svg.off('touchmove mousemove', currenthandler);
            }
            if (target === undefined) return;
            var x = target.getAttribute('cx');
            var y = target.getAttribute('cy');
            line.setAttribute('x2', x);
            line.setAttribute('y2', y);
        }

        function beginTrack(target) {
            code.push(target);
            var x = target.getAttribute('cx');
            var y = target.getAttribute('cy');
            var line = createNewLine(x, y);
            var marker = createNewMarker(x, y);
            actives.append(marker);
            currenthandler = updateLine(line);
            svg.on('touchmove mousemove', currenthandler);
            lines.append(line);
            if (options.vibrate) vibrate();
            return line;
        }

        function createNewMarker(x, y) {
            var marker = document.createElementNS(svgns, "circle");
            marker.setAttribute('cx', x);
            marker.setAttribute('cy', y);
            marker.setAttribute('r', 6);
            return marker;
        }

        function createNewLine(x1, y1, x2, y2) {
            var line = document.createElementNS(svgns, "line");
            line.setAttribute('x1', x1);
            line.setAttribute('y1', y1);
            if (x2 === undefined || y2 == undefined) {
                line.setAttribute('x2', x1);
                line.setAttribute('y2', y1);
            } else {
                line.setAttribute('x2', x2);
                line.setAttribute('y2', y2);
            }
            return line;
        }

        function getMousePos(e) {
            return {
                x: e.clientX || e.originalEvent.touches[0].clientX,
                y: e.clientY || e.originalEvent.touches[0].clientY
            };
        }

        function svgPosition(element, e) {
            var _getMousePos2 = getMousePos(e),
                x = _getMousePos2.x,
                y = _getMousePos2.y;

            pt.x = x; pt.y = y;
            return pt.matrixTransform(element.getScreenCTM().inverse());
        }

        function setPattern(pattern) {
            clear();
            var patternArray;
            if (typeof pattern === 'string') {
                patternArray = pattern.split('').map(Number);
            } else if (typeof pattern === 'number') {
                patternArray = String(pattern).split('').map(Number);
            } else if (Array.isArray(pattern)) {
                patternArray = pattern;
            } else {
                console.error('Patrón inválido. Use string, number o array.');
                return;
            }

            patternArray.forEach(function (digit, index) {
                var targetDot = dots[index];

                for (var i = 0; i < dots.length; i++) {
                    if (i + 1 === digit) {
                        targetDot = dots[i];
                        break;
                    }
                }

                if (targetDot && isAvailable(targetDot)) {
                    if (index === 0) {
                        var x = targetDot.getAttribute('cx');
                        var y = targetDot.getAttribute('cy');
                        var line = createNewLine(x, y);
                        var marker = createNewMarker(x, y);
                        actives.append(marker);
                        lines.append(line);
                        code.push(targetDot);
                        currentline = line;
                    } else {
                        var prevDot = dots[patternArray[index - 1] - 1];
                        if (prevDot) {
                            var x1 = prevDot.getAttribute('cx');
                            var y1 = prevDot.getAttribute('cy');
                            var x2 = targetDot.getAttribute('cx');
                            var y2 = targetDot.getAttribute('cy');

                            if (currentline) {
                                currentline.setAttribute('x2', x2);
                                currentline.setAttribute('y2', y2);
                            }

                            var newLine = createNewLine(x2, y2);
                            var newMarker = createNewMarker(x2, y2);
                            actives.append(newMarker);
                            lines.append(newLine);
                            code.push(targetDot);
                            currentline = newLine;
                        }
                    }
                }
            });

            if (currentline) 
                currentline.remove();

            if (code.length > 0) 
                svg.addClass('success');
        }
    }

    PatternLock.defaults = {
        onPattern: function onPattern() { },
        vibrate: true
    };

    return PatternLock;
});