/// @description Explode
   
for(i=0; i<360; i+=360/30)
    {
    with instance_create(x,y,WaterParticle)
        {
        image_blend = choose(c_blue, c_white, c_blue, c_aqua, c_navy)
        physics_apply_impulse(x,y, random_range(0.0002, 0.005)*cos(degtorad(other.i))*sqrt(global.timeDiff), random_range(0.002, 0.005)*sin(degtorad(other.i))*sqrt(global.timeDiff))
        }
    }
	
if (super){
	while (collision_line(x, y, x, room_height, Ground, true, true) and !place_meeting(x, y, Ground)) {
		y += 2;
	}
	instance_create(x, y, WaterFountain) 
}
    
audio_play_sound(SplashSound, 1, false)
    
instance_destroy()

