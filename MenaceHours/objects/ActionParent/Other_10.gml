/// @description Generic Action
// You can write your code in this editor

alarm[3] = room_speed/2
if !pickable
	instance_create_depth(mouse_x, mouse_y, depth-1, ActionSpark)
else{
	canDrop = false
	pickedUp = true
	var bb = getReachBox()
	depth = min(depth = myGround.depth, Player.depth)-2
	x = clamp(mouse_x, bb[0], bb[2])
	y = clamp(mouse_y, bb[1], bb[3])
}