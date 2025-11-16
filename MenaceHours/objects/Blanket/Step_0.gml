/// @description Run MiniGame
// You can write your code in this editor

event_inherited()
if TaskController.currMiniGame == id{
	if keyboard_check_pressed(vk_space){
		line = random(1)
	}
	if keyboard_check_pressed(vk_shift){
		folds = !folds
	}
	
	while fold[folds] != line{
		fold[folds] += sign(line-fold[folds])*min(abs(line-fold[folds]), 0.01)
		completeness = 110*(1-(abs(fold[0]-0.5) + abs(fold[1]-0.5))) div 1
	}
}