/// @description Reputation Vars
// You can write your code in this editor

amount = 0
repType = "none"
alarm[0] = room_speed*5

scrollSpeed = 1

myNumber = 0

with ReputationDisplay
	if alarm[0] > 0 and id != other.id
		other.myNumber += 1