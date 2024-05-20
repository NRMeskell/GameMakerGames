/// @description Bounce Sound 

//event_user(1)

/*///StrangeBounce

if phy_speed > 4
    {
    angle = irandom(360)
    bounceSpeed = phy_speed*0.4
    phy_speed_x = 0
    phy_speed_y = 0
    
    physics_apply_impulse(x + irandom_range(-5,5), y + irandom_range(-5,5), dcos(angle) * bounceSpeed, dsin(angle) * bounceSpeed)
    }

/* */
///afterBounce

if thrown
    {    
    //knock over
    with other
        {
        }
    //explode
    if (image_index = 1 or image_index = 3 or image_index = 6) and thrower != other.id
        {
        event_user(0)
        }
    }


/* */
/*  */
