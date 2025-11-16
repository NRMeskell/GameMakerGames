/// @description Move Camera to Follow Player
// You can write your code in this editor

var lowX  = Player.x - camera_get_view_width(view_camera[0])*1/3;
var highX = Player.x + camera_get_view_width(view_camera[0])*1/3;

if camera_get_view_x(view_camera[0]) > highX - camera_get_view_width(view_camera[0])*2/3
	cameraX = highX - camera_get_view_width(view_camera[0])*2/3
	
if camera_get_view_x(view_camera[0]) < lowX - camera_get_view_width(view_camera[0])*1/3
	cameraX = lowX - camera_get_view_width(view_camera[0])*1/3

cameraX = min(room_width-camera_get_view_width(view_camera[0]), max(0, cameraX))
camera_set_view_pos(view_camera[0], cameraX div 1, 0)


if keyboard_check_pressed(vk_backspace)
	game_restart()
