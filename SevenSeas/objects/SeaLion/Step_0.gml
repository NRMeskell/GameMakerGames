/// @description Get rid of Sea Lions
// You can write your code in this editor


if round(image_index) mod (image_number - 1) == 0 and alarm[0] <= 0{
	image_alpha = 0
	audio_sound_gain(mySound, 0, 500)
	alarm[0] = room_speed /2
}