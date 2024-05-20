/// @description Create Trail

//fire
with instance_create(x,y,ExplotionParticle)
    {
    fire = true
    image_blend = choose(c_black, c_gray, c_yellow, c_red, c_orange)
    physics_apply_impulse(x,y, -random_range(0.005, 0.01)*sqrt(global.timeDiff)*other.phy_speed_x*0.1, -random_range(0.005, 0.01)*sqrt(global.timeDiff)*other.phy_speed_y*0.1)
    }

