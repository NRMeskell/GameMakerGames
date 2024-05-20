/// @description Jump

if thrown
    {
    event_user(0)
    
    directionChange = 2
    directionForce = 0.1
    rocketForce = 2*power(global.timeDiff, 0.25)-(0.75*(global.gameMode == "golf"))
    
    if targetPlayer != noone and goForPlayer
        {
        desiredDirection = point_direction(x,y,(targetPlayer.x+x)/2, targetPlayer.y + 30 - power(point_distance(x, y, targetPlayer.x, targetPlayer.y)/15, 2))
        phy_rotation = -desiredDirection
        }
	else{
        desiredDirection = point_direction(x,y,irandom(room_width), 0)
        phy_rotation = -desiredDirection
        }

        
    //travel in direction
    physics_apply_impulse(x,y,cos(degtorad(phy_rotation))*rocketForce, sin(degtorad(phy_rotation))*rocketForce)
    }

physics_apply_force(x,y, 0, phy_mass * -4)

alarm[1] = room_speed/1.6/global.timeDiff

