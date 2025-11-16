/// @description Run MiniGame
// You can write your code in this editor

event_inherited()
if TaskController.currMiniGame == id{
	over = -1
	// mouse at correct height
	if (gameMY - height/2) < 20{
		if (gameMX - (width/2 - pegDis)) < 20
			over = 0
		else if (gameMX - (width/2)) < 20
			over = 1
		else if (gameMX - (width/2 + pegDis)) < 20
			over = 2
	}
	
	if mouse_check_button_pressed(mb_left){
		if currentDish == -1{
			// grab a dish
			for(var i=0; i<array_length(dishSpot); i++){
				if topDish[i] and over == dishSpot[i]
					currentDish = i
			}
		}else{
			// place current dish
			if over != -1{
				var canPlace = true
				for(var j=currentDish+1; j<array_length(dishSpot); j++){
					if dishSpot[j] == over canPlace = false
				}
				
				if canPlace{
					if over != dishSpot[currentDish]
						moves += 1
					if dishSpot[currentDish] == 2
						completeness -= 20
					dishSpot[currentDish] = over
					currentDish = -1
					if over == 2
						completeness += 20 
				}
			}
		}
	}
}