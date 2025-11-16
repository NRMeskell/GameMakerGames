/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if myGround == inst_669BD85E and !pickedUp{
	readyForTask = true
	image_index = TaskController.taskState[? global.DRAWING] != "complete" ? 4 : 5+Drawing.drawingNum;
}else{
	image_index = TaskController.taskState[? global.DRAWING] != "complete" ? 0 : 1+Drawing.drawingNum;
	readyForTask = false
	if myGround == inst_372F1680_1 and !pickedUp{
		var colObj = instance_place(x, y-5, PlatformParent)
		if colObj != noone 
			depth = colObj.depth - 2 
		else
			depth = 5
	}
}
