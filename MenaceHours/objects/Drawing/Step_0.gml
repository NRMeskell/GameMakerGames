/// @description Run MiniGame
// You can write your code in this editor

event_inherited()
if TaskController.currMiniGame == id{
	currCell = [clamp((gameMX - canStartX) div cellSize, 0, 24),
				clamp((gameMY - canStartY) div cellSize, 0, 24)]
				
	if mouse_check_button(mb_left){
		ds_grid_set(canvas, currCell[0], currCell[1], colors[currColor])
		ds_grid_set(canvas, currCell[0]-1, currCell[1], colors[currColor])
		ds_grid_set(canvas, currCell[0], currCell[1]-1, colors[currColor])
		ds_grid_set(canvas, currCell[0]+1, currCell[1], colors[currColor])
		ds_grid_set(canvas, currCell[0], currCell[1]+1, colors[currColor])
		
		// set correct amount
		correct = 0
		for(var i=0; i<25; i++){
			for (var j=0; j<25; j++){
				var curr = ds_grid_get(canvas, i, j), corr = ds_grid_get(goal, i, j);
				if curr == corr{
					correct += 1
				}
			}
		}
		var donePer = correct/(25*25*0.70)
		completeness = (donePer*100) div 1
	}
	
	for (var i=0; i<6; i++){
		if keyboard_check_pressed(ord(button[i])){
			currColor = i
		}
	}
}