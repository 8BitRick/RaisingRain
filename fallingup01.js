var canvas = document.getElementById("myCanvas");
var c = canvas.getContext("2d");
var h = 10

whole_canvas = [0,0,canvas.width, canvas.height];

normal_rect = [10, 20];

y = canvas.height;
r = [0,0,150,h];
fall_rate = 0;
counter = 0;
function fall(temp) {return Math.pow(2,(temp/6-10))*6;}

function xs() {return Math.random() * canvas.width;}
x=xs();
function rg() {return [x,y,10,20];}

cls = function() {
    c.fillStyle = 'black';
    c.fillRect.apply(c, whole_canvas);
}


function render() {
    cls();

    c.fillStyle = "#0000AA";
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
