/// @description Create Light Source

for(i=0; i<array_length_1d(myLight); i++){
    if x!=-100// and SunLight.volume < myLightOn
        {
        if myLight[i] == noone or !instance_exists(myLight[i]){// and (global.timeCycle > global.timeCycleLength/2){
            myLight[i] = instance_create(x + myLightX[i], y + myLightY[i], LightParent)   
            myLight[i].red = 0.03
            myLight[i].green = 0.03
            myLight[i].blue = 0.01
            myLight[i].myVolume = 10
			myLight[i].flickering = true
            if x == MapShip.slotX[1]
                myLight[i].lightLayer = 4
            else    
                myLight[i].lightLayer = 3
			}
    }
    else{
        if myLight[i] != noone{
            instance_destroy(myLight[i])
            myLight[i] = noone
        }
	}
}



