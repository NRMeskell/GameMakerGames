/// @description Make particle on landing

force = sqrt(power(phy_speed_x,2) + power(phy_speed_y,2))
if force > 2
    for(i=0; i<360; i+=360/3)
        {
        if instance_number(ContactParticle) < 300
            with instance_create(x,y,ContactParticle)
                {
                image_blend = choose(c_white, c_gray, c_ltgray, c_white)
                physics_apply_impulse(x,y, random_range(0.005, 0.01)*cos(degtorad(other.i))*0.2*other.force/5*sqrt(global.timeDiff), random_range(0.005, 0.01)*sin(degtorad(other.i))*0.2*other.force/5*sqrt(global.timeDiff))
                }
        }

