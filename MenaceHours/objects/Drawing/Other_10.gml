/// @description Draw Mini Game
// You can write your code in this editor

event_inherited()

// ONE TIME EVENT TO GET GOAL
if getGoal{
	var surf = surface_create(25, 25)
	surface_set_target(surf)
	draw_sprite(DrawingGuideSpr, drawingNum, 0, 0)
	surface_reset_target()
	for(var i=0; i<25; i++){
		for (var j=0; j<25; j++){
			var pixColor = surface_getpixel(surf, i, j)
			ds_grid_set(goal, i, j, pixColor)
		}
	}
	getGoal = false
}

draw_sprite(DrawingBackSpr, 0, 0, 0)
draw_sprite_ext(DrawingGuideSpr, drawingNum, 133, 10, 2, 2, 0, c_white, 1)
for(var i=0; i<25; i++){
	for(var j=0; j<25; j++){
		draw_set_color(ds_grid_get(canvas, i, j))
		draw_rectangle(canStartX + i*cellSize, canStartY+j*cellSize, canStartX + (i+1)*cellSize-1, canStartY+(j+1)*cellSize-1, false)
	}
	
	draw_sprite(CanvasCrossSpr, 0, canStartX + currCell[0]*cellSize, canStartY + currCell[1]*cellSize)
}

for(var i=0; i<3; i++){
	for(var j=0; j<2; j++){
		draw_set_color(colors[i+3*j])
		draw_circle(width-1-18*(3-i), 70 + 18*j, 8, false)
		draw_set_color(c_ltgray)
		draw_set_halign(fa_center)
		draw_set_valign(fa_center)
		draw_text(width-1-18*(3-i), 70 + 18*j, button[i+j*3])
		draw_circle(width-1-18*(3-i), 70 + 18*j, 8, true)
	}
}