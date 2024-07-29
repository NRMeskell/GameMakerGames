/// @description Move

x = Ship.drawX + placeX
y = room_height - Ship.middleWaves.waveBase - 40

if myLight == noone{
    myLight = instance_create(x + 85, y + 37, LightParent)   
    myLight.red = 0.05
    myLight.green = 0.05
    myLight.blue = 0.02
    myLight.myVolume = 30
    myLight.lightLayer = 3
	myLight.flicker = true
    }
else{
	myLight.x = x
	myLight.y = y - 54
}
	
if x < -1000{
	if myLight != noone
		instance_destroy(myLight)
    instance_destroy()
}


