/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

// washing texture
if alarm[0] > 0{
	if irandom(room_speed/2) == 0{
		instance_create_depth(x+irandom_range(-25, 25), y-irandom(50), depth-1, Bubble)
	}
}

if readyForTask and TaskController.taskState[? global.DISHES] != "complete"{
	if irandom(room_speed) == 0{
		instance_create_depth(x+irandom_range(-25, 25), y-irandom(50), depth-1, ActionSpark)
	}
}
