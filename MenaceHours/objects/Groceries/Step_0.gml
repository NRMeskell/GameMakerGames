/// @description Run MiniGame
// You can write your code in this editor

event_inherited()
var midX = (width + 48)/2, disX = 40, disY = 36, midY = height/2;
if TaskController.currMiniGame == id{
	over=-1
	// within y range
	if abs(gameMY - (midY+disY/2 + 18)) < 18 and alarm[1] < 1 and alarm[2] < 1{
		
		// within x ranges
		if abs(gameMX - (midX-disX)) < 18
			over = 0
		if abs(gameMX - (midX)) < 18
			over = 1
		if abs(gameMX - (midX+disX)) < 18
			over = 2
	}
	
	if mouse_check_button_pressed(mb_left) and over != -1{
		if over == goList[currGrocery]{
			alarm[2] = moveTime
			goX = gameMX; 
			goY = gameMY;
		}else{
			alarm[1] = waitTime
			completeness -= completeJump*2
		}
	}
	
	alarm[0] += (alarm[2] > -1) or (alarm[1] > -1)
}