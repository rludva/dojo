var c = document.getElementById("myCanvas");
var ctx = c.getContext("2d");


var line1 = {x1:200, y1:300, x2:50, y2:60, color:"#ff0000"}
var line2 = {x1:212, y1:377, x2:150, y2:140, color:"#ff0ff0"}

var lines = new Array();
lines.push(line1);
lines.push(line2);
insertLine(12,12,56,78,"#0000ff");
insertLine(121,182,256,278,"#0000ff");

for(i=0;i<12;i++) {
  x1 = getRandomX();
  y1 = getRandomY();
  x2 = getRandomX();
  y2 = getRandomY();
  color = getRandomColor();
  insertLine(x1,y1,x2,y2,color);
}


lines.forEach(drawLine);

function drawLine(item, index) {
  ctx.beginPath();
  ctx.lineWidth = getRandomNumber(10);
  ctx.strokeStyle = item.color;
  ctx.moveTo(item.x1, item.y1);
  ctx.lineTo(item.x2, item.y2);
  ctx.stroke(); 
}

function insertLine(x1, y1, x2, y2, color) {
  line = new Object();
  line.x1 = x1;
  line.y1 = y1;
  line.x2 = x2;
  line.y2 = y2;
  line.color = color;
  lines.push(line)
}

function getRandomNumber(max) {
  return Math.floor((Math.random() * max) + 1);
}

function getRandomX() {
	return getRandomNumber(c.width);
}
function getRandomY() {
	return getRandomNumber(c.height);
}
function getRandomColor() {
  var letters = '0123456789ABCDEF';
  var color = '#';
  for (var i = 0; i < 6; i++) {
    color += letters[Math.floor(Math.random() * 16)];
  }
  return color;
}