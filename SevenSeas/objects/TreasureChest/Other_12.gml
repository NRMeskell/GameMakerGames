/// @description Stop Digging
// You can write your code in this editor

if id == instance_find(TreasureChest, 0){
	sprite_index = ChestPoppingOutSpr
	image_index = 0
	image_speed = 0.2
	if treasureFound == true
		animationLen = image_number - 1
	else
		animationLen = 7
}
else
	instance_destroy()