/// @description Insert description here
// You can write your code in this editor

if room == GameRoom{
	var box = getGameBox()
	if (abs(x - (box[0] + box[2])/2) < 8) and (y < box[1] and y > box[1]-6){
		phy_speed_x = 0
		phy_speed_y = 0
		phy_position_x = (phy_position_x div 1)
		phy_position_y = ((phy_position_y * 2) div 1) / 2
		phy_position_y += 0.5
		phy_angular_velocity = 0
		phy_rotation = 0
	}


	if ((x > box[0]) and (y < box[3]+8 and y > box[3])){
		phy_speed_x = 0
		phy_speed_y = 0
		phy_position_y += 1
		phy_angular_velocity *= 0.5
	}
}else{
	if y > room_height*2 and SoundController.alarm[0] < 2{
		phy_position_x = mySpotX
		phy_position_y = mySpotY
		phy_angular_velocity = 0
		phy_rotation = 0
		phy_speed_x = 0
		phy_speed_y = 0
	}
	if y < 0{
		phy_angular_velocity = 0
		phy_rotation = 0
		phy_speed_x = 0
		phy_speed_y = 0.1
	}
}

phy_position_x = round(phy_position_x * 10) / 10
phy_position_y = round(phy_position_y * 10) / 10
