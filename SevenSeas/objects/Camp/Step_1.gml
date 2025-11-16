/// @description Create Light Source and name

if x!=-100
    {		
	if sprite_index == CampFireSpr{
		if !audio_is_playing(CampFireSnd){
			myFire = audio_play_sound(CampFireSnd, 0, false)
			audio_sound_gain(myFire, 1, 0)
		}
		myName = "camp"
	}else if sprite_index = CampFireDyingSpr{
		if !audio_is_playing(CampFireSnd){
			myFire = audio_play_sound(CampFireSnd, 0, false)
			audio_sound_gain(myFire, 0.8, 0)
			audio_sound_pitch(myFire, 0.7)
		}
		myName = "used camp"
	}
	else{
		if audio_is_playing(myFire)
			audio_stop_sound(myFire)
			
		myName = "dead camp"
		campPower = 0
	}
	
	if x!=-100{
	    if myLight[0] == noone or !instance_exists(myLight[0]){// and (global.timeCycle > global.timeCycleLength/2){
	        myLight[0] = instance_create(x + myLightX[0] + 6, y + myLightY[0], LightParent)   
	        myLight[0].red = 0.03
	        myLight[0].green = 0.03
	        myLight[0].blue = 0.01
	        myLight[0].myVolume = 15*(4-campPower)
			myLight[0].flickering = true
	        myLight[0].lightLayer = 3
			}
		else{
			if !instance_exists(myLight[0])
				myLight[0] = noone
			else
				myLight[0].myVolume = 15*(4-campPower)
		}
	}
	else{
		if myLight[0] != noone{
		    instance_destroy(myLight[0])
		    myLight[0] = noone
		}
	}
}
else{		
    if campFireLight != noone{
        instance_destroy(campFireLight)
        campFireLight = noone
    }
}