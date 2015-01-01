//var c = document.getElementById("myCanvas");
//var ctx = c.getContext("2d");
//ctx.fillStyle = "#FF0000";
//ctx.fillRect(0,0,150,75);

var canvas = document.getElementById("myCanvas");
var c = canvas.getContext("2d");
c.fillStyle = 'black';
whole_canvas = [0,0,canvas.width, canvas.height];
//c.fillRect(0,0,400,400);
//c.clearRect.apply(c, whole_canvas);
c.fillRect.apply(c, whole_canvas);

c.fillStyle = "#0000AA";
//c.fillRect(0,0,150,75);
var r = [0,0,150,75];
c.fillRect.apply(c, r);

function render() {
Math.random();
    Math.pow
}

setInterval(render,30);

/*
rect = function(vals) {
    context.fillRect(vals[0], vals[1], vals[2], vals[3]);
};

rect(r);
*/