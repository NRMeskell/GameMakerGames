/// @description drawSelf

if !instance_exists(Defeat){
    //Draw stuff
    statSep = sprite_get_height(StatSymbolSpr)
    actionSep = sprite_get_height(PlayerAttackActionsSpr)*0.8 + 5
    
    scrollSpeed = 5
    maxDrawHeight = statSep*ds_list_size(myStats) + actionSep*ds_list_size(myActions) + 5
    
    healthDiffNumber = image_number - ((healthDiff/maxHealth)*image_number)
    healthNumber = image_number - ((myHealth/maxHealth)*image_number)
    
    
    if CombatRunner.playerTurn and point_in_rectangle(window_view_mouse_get_x(0), window_view_mouse_get_y(0), x-sprite_width/2, y-sprite_height/2, x+sprite_width/2, y+sprite_height/2 + drawHeight) and __view_get( e__VW.XView, 0 ) = 0
        {
        if drawHeight < maxDrawHeight
            drawHeight += scrollSpeed
        drawTop = sprite_get_height(EnemyDropDownSpr) - drawHeight
        }
    else
        {
        if drawHeight > 0
            drawHeight -= scrollSpeed
        }
     
    //draw info   
    draw_sprite_part(EnemyDropDownSpr, 0, 0, drawTop, sprite_get_width(EnemyDropDownSpr), drawHeight, x-sprite_get_width(EnemyDropDownSpr)/2, y+sprite_height/2-1)
        
    for(i=0; i<ds_list_size(myStats); i++)
        {
        if i*statSep < drawHeight
            draw_sprite(StatSymbolSpr, ds_list_find_value(myStats, i), x - sprite_get_width(StatSymbolSpr)/2, y - sprite_get_height(StatSymbolSpr)/2 + drawHeight - i*statSep)
        }
        
    for(i=0; i<ds_list_size(myActions); i++)
        {
        if ds_list_size(myStats)*statSep + i*actionSep < drawHeight
            {
            myButtonType = ds_list_find_value(myActions, i)
            
            //Draw action display
			draw_sprite_ext(PlayerAttackActionsSpr, myButtonType.spriteNumber, x, y + drawHeight - (ds_list_size(myStats)*statSep + i*actionSep), -0.8, 0.8, 0, c_white, 0.8)
            
            //Draw action info
            if point_in_rectangle(window_view_mouse_get_x(0), window_view_mouse_get_y(0), x-13, y + drawHeight - (ds_list_size(myStats)*statSep + i*actionSep) - 13, x + 12, y + drawHeight - (ds_list_size(myStats)*statSep + i*actionSep) + 13) and __view_get( e__VW.XView, 0 ) = 0
            if !point_in_rectangle(window_view_mouse_get_x(0), window_view_mouse_get_y(0), x-20, y - 20, x+20, y+20)
                {
                startX = room_width - sprite_get_width(ActionInfoSpr)
                drawInfoY = y + drawHeight - (ds_list_size(myStats)*statSep + i*actionSep) + 60
                DrawActionInfo(myButtonType, startX, drawInfoY, false, "enemy", undefined)
                }
            }
        }
        
    //draw self()
    draw_sprite(EnemyFrameBackSpr, 0, x, y)
	if myHealth <= healthDiff{
	    draw_sprite_ext(EnemyFrameSpr, healthDiffNumber, x, y, 1, 1, 0, make_colour_rgb(181, 142, 2), 1)
	    draw_sprite_ext(EnemyFrameSpr, healthNumber, x, y, 1, 1, 0, c_red, 1)
	}else{
		draw_sprite_ext(EnemyFrameSpr, healthNumber, x, y, 1, 1, 0, make_colour_rgb(6, 148, 11), 1)
	    draw_sprite_ext(EnemyFrameSpr, healthDiffNumber, x, y, 1, 1, 0, c_red, 1)
	}
	draw_sprite(EnemyPictureSpr, image_index, x, y)
    
    if stunned
        draw_sprite(PirateInjuredSpr, 3, x + sprite_get_width(EnemyFrameSpr)/2 - 3, y - sprite_get_height(EnemyFrameSpr)/2 + 3)
    else if bleeding
        draw_sprite(PirateInjuredSpr, 2, x + sprite_get_width(EnemyFrameSpr)/2 - 3, y - sprite_get_height(EnemyFrameSpr)/2 + 3)
    else if exposed
        draw_sprite(PirateInjuredSpr, 4, x + sprite_get_width(EnemyFrameSpr)/2 - 3, y - sprite_get_height(EnemyFrameSpr)/2 + 3)
        }

