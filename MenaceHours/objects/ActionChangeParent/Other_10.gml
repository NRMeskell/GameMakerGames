/// @description Open/close cupboard
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if state == "closed"{
	state = "opened"
	image_index = 1
	readyForTask = true
	mainAction = "Close Door"
	for(var i=0; i<array_length(myPlat); i++){
		myPlat[i].available = true
		with ActionParent if myGround == other.myPlat[i]{
			visible = true
		}
	}
}
else if state == "opened" {
	canClose = true
	for(var i=0; i<array_length(myPlat); i++){
		if Moose.myGround == myPlat[i]
			canClose = false
	}
	if canClose{
		state = "closed"
		image_index = 0
		readyForTask = false
		mainAction = "Open Door"
		for(var i=0; i<array_length(myPlat); i++){
			myPlat[i].available = false
			with ActionParent if myGround == other.myPlat[i]{
				visible = false
			}
		}
	}
}