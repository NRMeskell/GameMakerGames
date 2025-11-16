/// @description Test if over
// You can write your code in this editor

var holding = false
with PlaceableParent if grabbed
	holding = true

hovering = position_meeting(mouse_x, mouse_y, id) and !holding

if hovering{
	if mouse_check_button_pressed(mb_left){
		event_user(0)
	}
}