/// @description Bounce Sound 

force = point_distance(old_speedx, old_speedy, phy_speed_x, phy_speed_y) * phy_mass

if force > 0.2
    {
    bounceSnd = audio_play_sound(myBounceSnd, 1, false)
    audio_sound_gain(bounceSnd, force/10, 0)
    audio_sound_pitch(bounceSnd, random_range(0.9, 1.1))
    }

if object_index = DodgeBall or object_index = SoccerBall
    myBounceSnd = choose(BounceSound, BounceSound2, BounceSound3)

///Make particle on landing

if force > 0.4
    for(i=0; i<360; i+=360/6)
        {
        if instance_number(ContactParticle) < 300
            with instance_create(x,y,ContactParticle)
                {
                image_blend = choose(c_white, c_gray, c_ltgray, c_white)
                physics_apply_impulse(x,y, random_range(0.005, 0.01)*sqrt(global.timeDiff)*cos(degtorad(other.i))*0.2*other.force, random_range(0.005, 0.01)*sqrt(global.timeDiff)*sin(degtorad(other.i))*0.2*other.force)
                }
        }

