/// @description Insert description here
// You can write your code in this editor

if irandom(1){
	i = irandom(360)
	with instance_create(x,y,WaterParticle)
	    {
	    image_blend = choose(c_blue, c_white, c_blue, c_aqua, c_navy)
	    physics_apply_impulse(x,y, random_range(0.0002, 0.005)*cos(degtorad(other.i))*sqrt(global.timeDiff), random_range(0.002, 0.005)*sin(degtorad(other.i))*sqrt(global.timeDiff))
	    }
}