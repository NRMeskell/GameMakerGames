/// @description Move to place

x = Ship.drawX + placeX
y = GetWaterLevel(Ship.middleWaves, x)

if sprite_index = SupplyBoxSpr{
	if myLight == noone{
	    myLight = instance_create(85, 37, LightParent)   
	    myLight.red = 0.05
	    myLight.green = 0.05
	    myLight.blue = 0.02
	    myLight.myVolume = 30
	    myLight.lightLayer = 3
		myLight.flicker = true
	}
	else{
		myLight.x = x + 2*dcos(image_angle)
		myLight.y = y + 20*dsin(image_angle)
	}

	if x < -1000{
		if myLight != noone
			instance_destroy(myLight)
	}
}
