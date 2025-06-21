/// @description Turn Around

if direction > 90 and direction < 270
    image_xscale = -1
else
    image_xscale = 1
    
if floatAway {
    path_end()
    direction = flyAwayDir
    speed = max(1, global.doTime*global.gameRate)
	if instance_find(BirdEvent, 0) == id{
		audio_sound_gain(mySound, 0, 1000)
	}
}

