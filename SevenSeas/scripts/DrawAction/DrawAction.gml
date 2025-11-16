function DrawAction(argument0, argument1, argument2, argument3) {
	myActionDrawer = instance_create(-100,-200,argument0)
	drawActionX = argument1
	drawActionY = argument2

	myActionDrawer.pirateDrawTest = true
    
	if object_is_ancestor(object_index, Enemy)
		x_scale = -1
	else
		x_scale = 1
		
	draw_sprite_ext(PlayerAttackActionsSpr, myActionDrawer.spriteNumber, drawActionX, drawActionY, x_scale*argument3, argument3, 0, c_white, 1)
        
	instance_destroy(myActionDrawer)
}
