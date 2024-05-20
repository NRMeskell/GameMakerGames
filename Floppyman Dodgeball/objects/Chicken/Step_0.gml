/// @description Recover

if phy_position_y > room_height + 25
    {
    instance_destroy()
    }
    
if phy_position_x < -50
    {   
    phy_position_x = -25
    phy_speed_x = 0
    phy_speed_y = 0
    }
    
if phy_position_x > room_width+50
    {
    phy_position_x = room_width+25
    phy_speed_x = 0
    phy_speed_y = 0
    }

///Cluck 

//Controlled by soundConteller

