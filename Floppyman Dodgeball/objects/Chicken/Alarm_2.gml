/// @description Insert description here
// You can write your code in this editor

goForPlayer = !goForPlayer
if irandom(1) or global.gameMode == "dodgeball" or goForPlayer
	alarm[2] = room_speed*5 + room_speed*10*goForPlayer

