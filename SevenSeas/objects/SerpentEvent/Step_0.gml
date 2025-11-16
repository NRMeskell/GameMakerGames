/// @description Move to place

x = Ship.drawX + placeX
y = (room_height - Ship.middleWaves.waveBase) - ((room_height - Ship.middleWaves.waveBase) - GetWaterLevel(Ship.middleWaves, x))/2 + placeY


for(var i=0; i<2; i++){
	if myLight[i] == noone or !instance_exists(myLight[i]){
		myLight[i] = instance_create(57, 57, LightParent)   
		myLight[i].red = 0.1
		myLight[i].green = 0.02
		myLight[i].blue = 0.02
		myLight[i].myVolume = 10
		myLight[i].lightLayer = 2
		myLight[i].flickering = false
	}
	else{
		myLight[i].x = x - 28 + 19*i
		myLight[i].y = y - 79 + 8*i
	}
}