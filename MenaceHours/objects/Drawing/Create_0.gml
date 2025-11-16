/// @description Drawing game
// You can write your code in this editor

// Inherit the parent event
event_inherited();

canvasSize = 100
canStartX = ((width-75)-canvasSize)/2
canStartY = ((height)-canvasSize)/2
cellSize = canvasSize/25

currCell = [0, 0]

gameName = global.DRAWING

correct = 0

drawingNum = irandom(2)
canvas = ds_grid_create(25, 25)
colors[0] = make_color_rgb(178, 12, 16)
colors[1] = make_color_rgb(20, 102, 38)
colors[2] = make_color_rgb(88, 141, 178)
colors[3] = make_color_rgb(204, 190, 0)
colors[4] = make_color_rgb(204, 204, 204)
colors[5] = make_color_rgb(51, 51, 51)

button[0] = "Q"
button[1] = "W"
button[2] = "E"
button[3] = "A"
button[4] = "S"
button[5] = "D"

for(var i=0; i<25; i++)
	for(var j=0; j<25; j++)
		ds_grid_set(canvas, i, j, make_color_rgb(189, 180, 153))
		
currColor = 0

goal = ds_grid_create(25, 25)
for(var i=0; i<25; i++)
	for(var j=0; j<25; j++)
		ds_grid_set(goal, i, j, colors[5])
getGoal = true

