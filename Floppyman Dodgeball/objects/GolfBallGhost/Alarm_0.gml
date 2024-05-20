/// @description Create New Ball

if !place_meeting(x,y,CharacterCollider) or phy_speed < 0.1{
	with instance_create(x,y,GolfBall){
		image_index = other.image_index
	    myCharacter = other.myCharacter
	    phy_speed_x = other.phy_speed_x*(1+0.5*(image_index == 4))
	    phy_speed_y = other.phy_speed_y*(1+0.5*(image_index == 4))
		phy_angular_velocity = other.phy_angular_velocity
	    myColor = other.myColor
	    }
	instance_destroy()
}
else
	alarm[0] = 2


