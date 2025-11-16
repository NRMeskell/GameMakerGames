/// @description Insert description here
// You can write your code in this editor

if myLight == noone or !instance_exists(myLight){// and (global.timeCycle > global.timeCycleLength/2){
	myLight = instance_create(x, y, LightParent)   
	myLight.red = 0.03
	myLight.green = 0.03
	myLight.blue = 0.01
	myLight.myVolume = 15
	myLight.flickering = true
	myLight.lightLayer = 3
	}
else{
	if !instance_exists(myLight)
		myLight = noone
	else{
		myLight.x = x
		myLight.y = y-5
	}
}