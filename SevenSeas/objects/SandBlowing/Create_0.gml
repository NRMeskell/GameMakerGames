/// @description vars


image_alpha = random(0.5)
image_speed = 0.4
    
mySound = audio_play_sound(HowlingWindSnd, 1, true)
with mySound
	audio_sound_pitch(mySound, random_range(0.8, 1.5))
if instance_number(SandBlowing) != 1{
	audio_stop_sound(mySound)
}else{
	audio_play_sound(HawkCrySnd, 0, false)
}
        


