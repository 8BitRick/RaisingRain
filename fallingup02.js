var canvas = document.getElementById("myCanvas");
var c = canvas.getContext("2d");

// Our Environment
whole_canvas = [0,0,canvas.width, canvas.height];
max_y = canvas.height;

// Our main falling thing
normal_rect = [10, 20];
normal_style = "#0000AA";

// Operations to do stuff
function fall(temp) {return Math.pow(2,(temp/6-10))*6;}
function xs() {return Math.random() * canvas.width;}
cls = function() {
    c.fillStyle = 'black';
    c.fillRect.apply(c, whole_canvas);
}

// Our array of falling objects
num_rects = 5;
counters = Array.apply(null, new Array(num_rects)).map(Number.prototype.valueOf,0);
fall_rates = Array.apply(null, new Array(num_rects)).map(Number.prototype.valueOf,0);
x_pos = Array.apply(null, new Array(num_rects)).map(Number.prototype.valueOf,xs());
y_pos = Array.apply(null, new Array(num_rects)).map(Number.prototype.valueOf,max_y);
function get_rect(index) {return return [x_pos[index],y_pos[index],10,20];}

rect = {
    counter:0,
    fall:0,
    x:0,
    y:0
};

rects = new Array(num_rects).map(function(){ return {counter: 0, fall: 0, x: xs(), y: max_y}});

rects.forEach(function(rect){window.alert("blah " + rect["x"])});

console.log("blah" + rects.length())

function render() {
    cls();

    c.fillStyle = "#0000AA";
    counters.forEach(function())
    c.fillRect.apply(c, rg());
    counter++;
    y -= fall(counter);
    if(y < 0)
    {
        y = canvas.height;
        counter = 0;
    }
    //c.fillRect(0,0,150,h);
}

//render();
setInterval(render,30);
