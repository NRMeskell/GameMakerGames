/// @description Create Bubble
// You can write your code in this editor

instance_create(x + irandom_range(-70, 50), y, BoilBubble)
alarm[0] = irandom_range(room_speed/4, room_speed/2)