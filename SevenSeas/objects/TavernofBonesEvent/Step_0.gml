/// @description Move

x = Ship.drawX + placeX
y = room_height - Ship.middleWaves.waveBase - placeY

if myLight == noone{
    myLight = instance_create(x + 65, y + 44, LightParent)   
    myLight.red = 0.05
    myLight.green = 0.05
    myLight.blue = 0.02
    myLight.myVolume = 20
    myLight.lightLayer = 2
	myLight.flicker = true
    }
else{
	myLight.x = x + 65
	myLight.y = y + 44
}
	
if x < -1000{
	if myLight != noone
		instance_destroy(myLight)
    instance_destroy()
}


