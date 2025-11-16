/// @description Vars

image_speed = 0
image_index = choose(1,0)

x = Ship.drawX
y = room_height

mySound = noone

repeat(15)
	instance_create(x + irandom_range(-75, 50), irandom_range(Ship.drawY, room_height), BoilBubble)

floatAway = false

alarm[0] = 1
