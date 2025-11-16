/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if grabbed{
	currEx = 0
	myPlat.phy_active = false
}else{
	if currEx < desireEx{
		currEx += min(exRate, abs(currEx - desireEx))
	}
	else if currEx > desireEx{
		currEx -= min(0.5, abs(currEx - desireEx))
	}else if currEx == maxEx{
		desireEx = 0
	}
	
	myPlat.phy_active = true
}

myPlat.phy_position_x = phy_position_x - currEx*dsin(image_angle)
myPlat.phy_position_y = phy_position_y - currEx*dcos(image_angle)
myPlat.phy_rotation = phy_rotation