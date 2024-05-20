/// @description Reputation Display Control
// You can write your code in this editor

if amount == 0
	instance_destroy()
	
if alarm[0] > 0 and y < MapCreator.conquerButtonY + 20*myNumber{
	y += scrollSpeed
}
else if alarm[0] == -1
	y -= scrollSpeed
	
if y < -50
	instance_destroy()