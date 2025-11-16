/// @description Switch
// You can write your code in this editor

with mySwitch{
	event_user(0)
}

if mySwitch.desireEx == mySwitch.maxEx and mySwitch.currEx < mySwitch.maxEx{
	with other{
		phy_speed_x = (other.x - other.xprevious)*1.5
		phy_speed_y = (other.y - other.yprevious)*1.5
	}
}