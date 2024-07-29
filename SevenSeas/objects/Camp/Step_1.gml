/// @description Create Light Source and name

if x!=-100
    {		
	if sprite_index == CampFireSpr{
		myName = "camp"
	}else if sprite_index = CampFireDyingSpr{
		myName = "used camp"
	}
	else{
		myName = "dead camp"
		campPower = 0
	}
	
	if x!=-100{
	    if myLight[0] == noone{// and (global.timeCycle > global.timeCycleLength/2){
	        myLight[0] = instance_create(x + myLightX[0], y + myLightY[0], LightParent)   
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
else
    if campFireLight != noone{
        instance_destroy(campFireLight)
        campFireLight = noone
    }