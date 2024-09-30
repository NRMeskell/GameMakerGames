if campFireLight != noone{
    instance_destroy(campFireLight)
    campFireLight = noone
    }
	
if audio_is_playing(myFire)
	audio_stop_sound(myFire)

