/// @description Turn Around

if direction > 90 and direction < 270
    image_xscale = -1
else
    image_xscale = 1
   

if myLight == noone or !instance_exists(myLight){
    myLight = instance_create(x, y, LightParent)   
    myLight.red = 0.22
    myLight.green = 0.16
    myLight.blue = 0.22
    myLight.myVolume = 5*image_xscale
    myLight.lightLayer = myLayer
	myLight.flickering = true
    }
else{
	myLight.x = x
	myLight.y = y
	myLight.myVolume = 5*image_xscale
}

if floatAway
    {
	image_xscale -= 0.01*max(1, global.doTime*global.gameRate)
	image_yscale -= 0.01*max(1, global.doTime*global.gameRate)
	
	if image_xscale < 0.01
		instance_destroy()
    }