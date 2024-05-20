function MakeLight(argument0, argument1, argument2, argument3, argument4) {
	surface_set_target(global.lightSurface[argument3])
	draw_set_color(c_black)
	draw_set_blend_mode(bm_subtract)
	draw_set_alpha(0.2)
	for(i=0; i<argument2; i+=argument2*0.2)
	    draw_circle(argument0, argument1, argument2, false)
  
	draw_set_blend_mode(bm_normal)  
	draw_set_color(argument4)
	draw_set_alpha(0.1)
	for(i=0; i<argument2 div 2; i+=argument2*0.2)
	    {
	    draw_circle(argument0, argument1, argument2, false)
	    }
	draw_set_alpha(1)
	surface_reset_target()



}
