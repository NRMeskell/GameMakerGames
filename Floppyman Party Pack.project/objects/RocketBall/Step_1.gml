/// @description rocket

if thrown
    {
    directionChange = 2
    directionForce = 0.1
    rocketForce = 8*(global.timeDiff)
    
    if targetPlayer != noone
        {
        desiredDirection = point_direction(x,y,targetPlayer.x, targetPlayer.y)
        phy_rotation = -desiredDirection
        }

        
    //travel in direction
    physics_apply_force(x,y,cos(degtorad(phy_rotation))*rocketForce, sin(degtorad(phy_rotation))*rocketForce)
    physics_apply_force(x,y, 0, phy_mass * -8*(global.timeDiff))
    
    
    //fire
    if irandom(4) = 0
    with instance_create(x,y,ExplotionParticle)
        {
        fire = true
        image_blend = choose(c_black, c_gray, c_yellow, c_red, c_orange)
        physics_apply_impulse(x,y, -random_range(0.005, 0.01)*sqrt(global.timeDiff)*cos(degtorad(other.phy_rotation)), -random_range(0.005, 0.01)*sqrt(global.timeDiff)*sin(degtorad(other.phy_rotation)))
        }
        
    if startedRocket == false
        {
        startedRocket = true
        myRocket = audio_play_sound(RocketSound, 1, false)
        audio_sound_gain(myRocket, 0.2, 0)
        }
    }
    
if alarm[2] > 0
    {
    if startedRocket
        audio_sound_pitch(myRocket, audio_sound_get_pitch(myRocket)+0.05)
    }

