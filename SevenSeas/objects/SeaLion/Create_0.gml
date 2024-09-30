/// @description vars

mySound = audio_play_sound(SeaLionsAngrySnd, 1, true)
audio_sound_set_track_position(mySound, irandom(1))
audio_sound_gain(mySound, 0, 0)
audio_sound_gain(mySound, 0.3, 200)
audio_sound_pitch(mySound, random_range(0.8, 1.2))
   
   
facing = choose(true, false)
if facing{
	image_index = 1
	image_speed = 0.26
}
else{
	image_index = image_number - 1
	image_speed = -0.26
}


