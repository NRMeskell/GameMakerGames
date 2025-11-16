/// @description Do Actions
// You can write your code in this editor

// check if lower-depth objected are being hovered
var canHover = true
with ActionParent if (id != other.id) and ((depth<=other.depth and hoveringOver) or pickedUp){
	canHover = false
}
// picked up (handle other objects)
hoveringOver = false
if TaskController.currMiniGame == noone and visible{
	if canHover{
		hoveringOver = instance_position(mouse_x, mouse_y, other.id) or pickedUp
	}

	var use = mouse_check_button_pressed(mb_left) and alarm[3] < 1
	if hoveringOver{
		if use and InReach() and !pickedUp{
			event_user(0)
			hoveringOver = instance_position(mouse_x, mouse_y, other.id) or pickedUp
		}
	}
}
