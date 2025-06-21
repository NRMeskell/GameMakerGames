/// @description @description DrawActionInfo(action, x, y, draw required slots, attacker, priority, allowed)
/// @param action
/// @param  x
/// @param  y
/// @param  draw required slots
/// @param  attacker
/// @param  priority
/// @param  allowed
function DrawActionInfo(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {
	if argument0 != LostEyeAction{
	myActionDrawer = instance_create(-100, -200, argument0)
	drawInfoX = argument1
	drawInfoY = argument2
	if argument6 == undefined
		argument6 = true
	
	with myActionDrawer
	    {
	    pirateDrawTest = true
	    myPirate = other.id   
	    if argument4 == "enemy"
	        enemyAction = true
	    event_user(2) 
	    }

	if argument4 == "pirate"
	    {
	    if myActionDrawer.actionType = "melee"
	        draw_sprite(ActionInfoSpr, 0+4*!argument6, drawInfoX, drawInfoY)
	    if myActionDrawer.actionType = "ranged"
	        draw_sprite(ActionInfoSpr, 1+4*!argument6, drawInfoX, drawInfoY)
	    if myActionDrawer.actionType = "cannon"
	        draw_sprite(ActionInfoSpr, 2+4*!argument6, drawInfoX, drawInfoY)
	    if myActionDrawer.actionType = "ship"
	        draw_sprite(ActionInfoSpr, 3+4*!argument6, drawInfoX, drawInfoY)
	    }
	else
	    {
	    if myActionDrawer.actionType = "melee"
	        draw_sprite(EnemyActionInfoSpr, 0, drawInfoX, drawInfoY)
	    if myActionDrawer.actionType = "ranged"
	        draw_sprite(EnemyActionInfoSpr, 1, drawInfoX, drawInfoY)
	    if myActionDrawer.actionType = "cannon"
	        draw_sprite(EnemyActionInfoSpr, 2, drawInfoX, drawInfoY)
	    if myActionDrawer.actionType = "ship"
	        draw_sprite(EnemyActionInfoSpr, 3, drawInfoX, drawInfoY)
	    }
    
	draw_set_color(c_black) 
	draw_set_valign(fa_top)   
	draw_set_halign(fa_right)
	draw_set_font(global.PirateFont)

	draw_text(drawInfoX + myActionDrawer.timerX, drawInfoY - myActionDrawer.nameY, string_hash_to_newline(myActionDrawer.rechargeTime))
	if argument5 == undefined
	    draw_text(drawInfoX + myActionDrawer.timerX - 26, drawInfoY - myActionDrawer.nameY, string_hash_to_newline(string(myActionDrawer.priorityMin) + "-" + string(myActionDrawer.priorityMax)))
	else
	    draw_text(drawInfoX + myActionDrawer.timerX - 26, drawInfoY - myActionDrawer.nameY, string_hash_to_newline(argument5))

	draw_set_halign(fa_left)
	draw_text(drawInfoX + myActionDrawer.shiftX, drawInfoY - myActionDrawer.nameY, string_hash_to_newline(myActionDrawer.name))
	draw_text_ext(drawInfoX + myActionDrawer.shiftX, drawInfoY - myActionDrawer.descY, string_hash_to_newline(myActionDrawer.description), 11, myActionDrawer.drawWidth)
	if myActionDrawer.requiredSlot[0] != "none" and argument3 == true
	    {
	    draw_set_color(make_color_rgb(40, 20, 0))
	    draw_text(drawInfoX + myActionDrawer.shiftX, 3+ drawInfoY - myActionDrawer.descY + string_height_ext(string_hash_to_newline("###"), 11, myActionDrawer.drawWidth), string_hash_to_newline("Required Slot Type:"))
	    for(r=0; r<array_length_1d(myActionDrawer.requiredSlot); r++)
	        {
	        if r > 0
	            draw_text(drawInfoX + myActionDrawer.shiftX + string_width(string_hash_to_newline("Required Slot Type:")) + 13 + (r-1)*13, 3 +drawInfoY - myActionDrawer.descY + string_height_ext(string_hash_to_newline("###"), 11, myActionDrawer.drawWidth), string_hash_to_newline(","))
	        draw_sprite_ext(SmallStatSymbolSpr, ds_map_find_value(myActionDrawer.requiredTypeMap, myActionDrawer.requiredSlot[r]), drawInfoX + myActionDrawer.shiftX + string_width(string_hash_to_newline("Required Slot Type:")) + r*13, 5 + drawInfoY - myActionDrawer.descY + string_height_ext(string_hash_to_newline("###"), 11, myActionDrawer.drawWidth) - 4, 0.9, 0.9, 0, c_white, 1)
	        }
	    }
    
	instance_destroy(myActionDrawer)
	}
}
