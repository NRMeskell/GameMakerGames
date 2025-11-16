/// @description Run Mini Game
// You can write your code in this editor


if TaskController.currMiniGame == id{
	if completeness >= 100 or keyboard_check_pressed(vk_escape){
		end_minigame()
	}
	
	if completeness < 0{
		completeness = 0
	}
	
	gameMX = (mouse_x - camera_get_view_x(view_camera[0]) - (xc - width/2)) div 1
	gameMY = (mouse_y - camera_get_view_y(view_camera[0]) - (yc - height/2)) div 1
}