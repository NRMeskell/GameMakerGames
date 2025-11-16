/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if grabbed{
	myPlat.phy_position_x = phy_position_x
	myPlat.phy_position_y = phy_position_y
	myPlat.phy_rotation = phy_rotation + platRot
	myPlat.phy_active = false
}else{
	if myPlat.phy_rotation - phy_rotation < platRot{
		myPlat.phy_rotation += min(2, abs((myPlat.phy_rotation - phy_rotation) - platRot))
	}
	else if myPlat.phy_rotation - phy_rotation > platRot{
		myPlat.phy_rotation -= min(2, abs((myPlat.phy_rotation - phy_rotation) - platRot))
	}
	myPlat.phy_active = true
}
