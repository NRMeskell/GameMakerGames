/// @description Explode
   
for(i=0; i<360; i+=360/30)
    {
    with instance_create(x,y,WaterParticle)
        {
        image_blend = choose(c_blue, c_white, c_blue, c_aqua, c_navy)
        physics_apply_impulse(x,y, random_range(0.005, 0.01)*cos(degtorad(other.i))*0.75*sqrt(global.timeDiff), random_range(0.005, 0.01)*sin(degtorad(other.i))*0.75*sqrt(global.timeDiff))
        }
    }
    
audio_play_sound(SplashSound, 1, false)
    
instance_destroy()

