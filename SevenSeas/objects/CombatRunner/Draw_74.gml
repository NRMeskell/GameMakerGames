var __b__;
__b__ = action_if_variable(instance_exists(Defeat), false, 0);
if __b__
{
{
///Draw Stuff

if alarm[1] == -1
    {
    draw_self()
    draw_set_halign(fa_right)
    draw_set_valign(fa_center)
    draw_set_color(c_black)
	draw_set_font(global.PirateFont)
    draw_text_transformed(x - 30, y+1, string_hash_to_newline(name), 1.3, 1.3, 0)
    
    healthBarWidth = 332
	if myHealth <= healthDiff{
	    healthDiffWidth = (1-(healthDiff/maxHealth))*healthBarWidth
	    myHealthWidth = (1-(myHealth/maxHealth))*healthBarWidth
	}else{
		healthDiffWidth = (1-(myHealth/maxHealth))*healthBarWidth
	    myHealthWidth = (1-(healthDiff/maxHealth))*healthBarWidth
	}
    //Draw Health
    if myHealth <= healthDiff
		draw_set_color(make_colour_rgb(151, 122, 2))
	else
		draw_set_color(make_colour_rgb(12, 145, 0))
		
    draw_rectangle(x-21-healthDiffWidth,(y-19)+33,x-21-myHealthWidth,(y-18)+33,false)
	
	if myHealth <= healthDiff
		draw_set_color(merge_color(c_black,c_red,0.7))
	else
		draw_set_color(make_colour_rgb(151, 122, 2))
    draw_rectangle(x-21-healthBarWidth, (y-19)+33, x-21-myHealthWidth, (y-18)+33, false)
	
    draw_set_color(merge_color(c_black,c_red,0.6))
    draw_rectangle(x-21-healthBarWidth, (y-19)+33, x-21-myHealthWidth, (y-18)+33, false)
    
	//draw health marks
	draw_set_color(c_black)
	draw_set_alpha(0.75)
	healthDis = 25*(sprite_get_width(EnemyMainFrameSpr)-21)/(maxHealth)
	for(i=0; i<(sprite_get_width(EnemyMainFrameSpr)-21); i++){
		markX = x-sprite_get_width(EnemyMainFrameSpr)+healthDis*i
		draw_rectangle(markX, (y-19)+33, markX, (y-18)+33, false)
	}
	draw_set_alpha(1)
}

///Draw End Turn Button

if playerTurn and __view_get( e__VW.XView, 0 ) = 0
    {
    showSkipButton = true
    with ActionParent
        if selected
            other.showSkipButton = false     
    
    if (canEndTurn or showSkipButton){
        if overEndTurnButton
            draw_sprite_ext(EndTurnSpr, !canEndTurn, startX, startY-yGap,1,1,0,c_ltgray,1)
        else
            draw_sprite_ext(EndTurnSpr, !canEndTurn, startX, startY-yGap,1,1,0,c_white,1)
        }
        
    drawOptionsX = room_width-45
    drawOptionsY = 128
    drawOptionsDis = 40
    
    if !instance_exists(Event){
        for(var i=0; i<ds_list_size(possibleEnemyActions); i++){
			overAction[i] = false
            draw_set_halign(fa_right)
            draw_set_valign(fa_center)
            draw_set_color(make_color_rgb(50, 50, 50))
            draw_set_font(global.LargePirateFont)
            
            //draw possible actions
            showAction = ds_list_find_value(possibleEnemyActions, i) 
			if (i>1){
				draw_set_color(merge_color(c_yellow,c_black,0.4))
				draw_text(drawOptionsX - 20, drawOptionsY + i*drawOptionsDis, string_hash_to_newline(string(showAction.priorityMin) + "-" + string(showAction.priorityMax)))
			}
			canHover = true
			with Enemy 
				if drawHeight > 5
					other.canHover = false
			
			if canHover and point_in_rectangle(mouse_x, mouse_y, drawOptionsX-20, drawOptionsY + i*drawOptionsDis - 20, drawOptionsX+20, drawOptionsY + i*drawOptionsDis + 20){
				draw_sprite_ext(PlayerAttackFrameSpr, 0, drawOptionsX, drawOptionsY + i*drawOptionsDis, -1, 1, 0, c_ltgray, 1)
				draw_sprite_ext(PlayerAttackActionsSpr, showAction.spriteNumber, drawOptionsX, drawOptionsY + i*drawOptionsDis, -1, 1, 0, c_ltgray, 1)
				overAction[i] = true
			}
			else{
				draw_sprite_ext(PlayerAttackFrameSpr, 0, drawOptionsX, drawOptionsY + i*drawOptionsDis, -1, 1, 0, c_white, 1)
				draw_sprite_ext(PlayerAttackActionsSpr, showAction.spriteNumber, drawOptionsX, drawOptionsY + i*drawOptionsDis, -1, 1, 0, c_white, 1)
			}
		}
    }
        
    draw_set_font(global.PirateFont)
    }


}
}