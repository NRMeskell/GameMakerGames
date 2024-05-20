/// @description Display character key selections

if creatingCharacter
    {
    //draw_text(80,100, ds_list_find_value(controllerInputNumList, characterSelect))
    if ds_list_find_value(inputControllerList, characterSelect) == false
        {
        checkLeftHeld = keyboard_check(ord("A")) or keyboard_check(vk_left)  or (mouse_check_button(mb_left) and abs(mouse_x - (drawStartx - arrowWidth)) < 10)
        checkRightHeld = keyboard_check(ord("D")) or keyboard_check(vk_right)  or (mouse_check_button(mb_left) and abs(mouse_x - (drawStartx + arrowWidth)) < 10)
        }
    else
        {
        checkLeftHeld = gamepad_button_check(ds_list_find_value(controllerInputNumList, characterSelect), gp_padl) or gamepad_axis_value(ds_list_find_value(controllerInputNumList, characterSelect), gp_axislh) < -0.5
        checkRightHeld = gamepad_button_check(ds_list_find_value(controllerInputNumList, characterSelect), gp_padr) or gamepad_axis_value(ds_list_find_value(controllerInputNumList, characterSelect), gp_axislh) > 0.5
        }
    }

if room == PartyPackRoom
    {   
    buttonDisplayList[0] = leftButtonList
    buttonDisplayList[1] = rightButtonList
    buttonDisplayList[2] = upButtonList
    buttonDisplayList[3] = throwButtonList
    
    draw_sprite(StandBackgroundSpr, 0, (standx[2] + standx[3])/2, standDef - 10 + sprite_get_height(MenuStandSpr) - sprite_get_height(StandBackgroundSpr)/2 + 4)
    
    headSize = 20    
    for(i=0; i < ds_list_size(leftButtonList); i++)
        {
        standy[i] = cos(current_time/1000 + i*2)*3
        draw_set_halign(fa_center)
        draw_set_valign(fa_bottom)
        standCharHead = standy[i] + standDef - characterHeight - 10*(mouseOverCharacter == i)*(room==PartyPackRoom)
        draw_set_color(characterColors[i])
        draw_text(standx[i], standCharHead - 30, string_hash_to_newline("PLAYER " + string(i+1)))
        draw_sprite_ext(MenuArmSkinSpr, ds_list_find_value(shirtList, i), standx[i]-sprite_get_width(MenuBodySpr)*characterSize/2-sprite_get_height(MenuArmSpr)*characterSize/3, standCharHead + sprite_get_height(MenuBodySpr)*characterSize/2 + (headSize-6)*characterSize/2, characterSize, -characterSize, 260, ds_list_find_value(skinList, i), 1)
        draw_sprite_ext(MenuArmSkinSpr, ds_list_find_value(shirtList, i), standx[i]+sprite_get_width(MenuBodySpr)*characterSize/2+sprite_get_height(MenuArmSpr)*characterSize/4, standCharHead + sprite_get_height(MenuBodySpr)*characterSize/2 + (headSize-6)*characterSize/2, characterSize, characterSize, 280, ds_list_find_value(skinList, i), 1) 
        draw_sprite_ext(MenuHandSkinSpr, ds_list_find_value(shirtList, i), standx[i]-sprite_get_width(MenuBodySpr)*characterSize/2-sprite_get_height(MenuArmSpr)*characterSize/2, standCharHead + sprite_get_height(MenuBodySpr)*characterSize/2 + (headSize-6)*characterSize/2 + sprite_get_width(MenuArmSpr)*characterSize, characterSize, -characterSize, 270, ds_list_find_value(skinList, i), 1) 
        draw_sprite_ext(MenuHandSkinSpr, ds_list_find_value(shirtList, i), standx[i]+sprite_get_width(MenuBodySpr)*characterSize/2+sprite_get_height(MenuArmSpr)*characterSize/2-1, standCharHead + sprite_get_height(MenuBodySpr)*characterSize/2 + (headSize-6)*characterSize/2 + sprite_get_width(MenuArmSpr)*characterSize, characterSize, characterSize, 270, ds_list_find_value(skinList, i), 1)  
        draw_sprite_ext(MenuLegSkinSpr, ds_list_find_value(pantsList, i), standx[i]-sprite_get_width(MenuLegSpr)*characterSize/2, standCharHead + sprite_get_height(MenuBodySpr)*characterSize + headSize*characterSize/2 + sprite_get_height(MenuLegSpr)*characterSize/2, -characterSize, characterSize, 0, ds_list_find_value(skinList, i), 1)
        draw_sprite_ext(MenuLegSkinSpr, ds_list_find_value(pantsList, i), standx[i]+sprite_get_width(MenuLegSpr)*characterSize/2, standCharHead + sprite_get_height(MenuBodySpr)*characterSize + headSize*characterSize/2 + sprite_get_height(MenuLegSpr)*characterSize/2, characterSize, characterSize, 0, ds_list_find_value(skinList, i), 1)
        draw_sprite_ext(MenuFootSkinSpr, ds_list_find_value(pantsList, i), standx[i]-sprite_get_width(MenuLegSpr)*characterSize/2, standCharHead + sprite_get_height(MenuBodySpr)*characterSize + headSize*characterSize/2 + sprite_get_height(MenuLegSpr)*characterSize + sprite_get_height(MenuFootSpr)*characterSize/2, -characterSize, characterSize, 0, ds_list_find_value(skinList, i), 1)
        draw_sprite_ext(MenuFootSkinSpr, ds_list_find_value(pantsList, i), standx[i]+sprite_get_width(MenuLegSpr)*characterSize/2, standCharHead + sprite_get_height(MenuBodySpr)*characterSize + headSize*characterSize/2 + sprite_get_height(MenuLegSpr)*characterSize + sprite_get_height(MenuFootSpr)*characterSize/2, characterSize, characterSize, 0, ds_list_find_value(skinList, i), 1) 
        draw_sprite_ext(MenuBodySkinSpr, ds_list_find_value(shirtList, i), standx[i], standCharHead + sprite_get_height(MenuBodySpr)*characterSize/2 + headSize*characterSize/2, characterSize, characterSize, 0, ds_list_find_value(skinList, i), 1)
		
		draw_sprite_ext(MenuArmSpr, ds_list_find_value(shirtList, i), standx[i]-sprite_get_width(MenuBodySpr)*characterSize/2-sprite_get_height(MenuArmSpr)*characterSize/3, standCharHead + sprite_get_height(MenuBodySpr)*characterSize/2 + (headSize-6)*characterSize/2, characterSize, -characterSize, 260, -1, 1)
        draw_sprite_ext(MenuArmSpr, ds_list_find_value(shirtList, i), standx[i]+sprite_get_width(MenuBodySpr)*characterSize/2+sprite_get_height(MenuArmSpr)*characterSize/4, standCharHead + sprite_get_height(MenuBodySpr)*characterSize/2 + (headSize-6)*characterSize/2, characterSize, characterSize, 280, -1, 1) 
        draw_sprite_ext(MenuHandSpr, ds_list_find_value(shirtList, i), standx[i]-sprite_get_width(MenuBodySpr)*characterSize/2-sprite_get_height(MenuArmSpr)*characterSize/2, standCharHead + sprite_get_height(MenuBodySpr)*characterSize/2 + (headSize-6)*characterSize/2 + sprite_get_width(MenuArmSpr)*characterSize, characterSize, -characterSize, 270, -1, 1) 
        draw_sprite_ext(MenuHandSpr, ds_list_find_value(shirtList, i), standx[i]+sprite_get_width(MenuBodySpr)*characterSize/2+sprite_get_height(MenuArmSpr)*characterSize/2-1, standCharHead + sprite_get_height(MenuBodySpr)*characterSize/2 + (headSize-6)*characterSize/2 + sprite_get_width(MenuArmSpr)*characterSize, characterSize, characterSize, 270, -1, 1)  
        draw_sprite_ext(MenuLegSpr, ds_list_find_value(pantsList, i), standx[i]-sprite_get_width(MenuLegSpr)*characterSize/2, standCharHead + sprite_get_height(MenuBodySpr)*characterSize + headSize*characterSize/2 + sprite_get_height(MenuLegSpr)*characterSize/2, -characterSize, characterSize, 0, -1, 1)
        draw_sprite_ext(MenuLegSpr, ds_list_find_value(pantsList, i), standx[i]+sprite_get_width(MenuLegSpr)*characterSize/2, standCharHead + sprite_get_height(MenuBodySpr)*characterSize + headSize*characterSize/2 + sprite_get_height(MenuLegSpr)*characterSize/2, characterSize, characterSize, 0, -1, 1)
        draw_sprite_ext(MenuFootSpr, ds_list_find_value(pantsList, i), standx[i]-sprite_get_width(MenuLegSpr)*characterSize/2, standCharHead + sprite_get_height(MenuBodySpr)*characterSize + headSize*characterSize/2 + sprite_get_height(MenuLegSpr)*characterSize + sprite_get_height(MenuFootSpr)*characterSize/2, -characterSize, characterSize, 0, -1, 1)
        draw_sprite_ext(MenuFootSpr, ds_list_find_value(pantsList, i), standx[i]+sprite_get_width(MenuLegSpr)*characterSize/2, standCharHead + sprite_get_height(MenuBodySpr)*characterSize + headSize*characterSize/2 + sprite_get_height(MenuLegSpr)*characterSize + sprite_get_height(MenuFootSpr)*characterSize/2, characterSize, characterSize, 0, -1, 1) 
        draw_sprite_ext(MenuBodySpr, ds_list_find_value(shirtList, i), standx[i], standCharHead + sprite_get_height(MenuBodySpr)*characterSize/2 + headSize*characterSize/2, characterSize, characterSize, 0, -1, 1)
        draw_sprite_ext(MenuHeadSpr, ds_list_find_value(headList, i), standx[i]+1, standCharHead, characterSize, characterSize, 0, -1, 1)
        draw_set_valign(fa_top)
        }
    for(i=0; i<6; i++){
        if i>= ds_list_size(leftButtonList)
            standy[i] = 0
        draw_sprite_part(MenuStandSpr, 0, 0, 0, sprite_get_width(MenuStandSpr), 40 - standy[i], standx[i]-sprite_get_width(MenuStandSpr)/2, standy[i] + standDef)
        }
        
    if room == PartyPackRoom{
        draw_sprite(StandRimSpr, 0, (standx[2] + standx[3])/2, standDef + 137 + sprite_get_height(MenuStandSpr) - sprite_get_height(StandBackgroundSpr)/2 + 4)
        draw_set_color(merge_color(c_gray, c_white, abs(cos(current_time/1000))))
        draw_set_halign(fa_center)
        draw_set_valign(fa_bottom)
        draw_text((standx[2] + standx[3])/2, standDef + 80, string_hash_to_newline("CREATE character: ENTER or BUTTON4"))
        }

    if creatingCharacter
        {
        //draw character
        draw_sprite(MenuCreationFrameSpr, 0, drawStartx, drawStarty)
        draw_sprite(MenuFrameInsideSpr, 0, drawStartx, drawStarty-62)
        drawCharactery = drawStarty-60-characterHeight+sprite_get_height(MenuFrameInsideSpr)/2 - 15
        
		draw_sprite_ext(MenuArmSkinSpr, 0, drawStartx-sprite_get_width(MenuBodySpr)*characterSize/2-sprite_get_height(MenuArmSpr)*characterSize/3, drawCharactery + sprite_get_height(MenuBodySpr)*characterSize/2 + (headSize-6)*characterSize/2, characterSize, -characterSize, 260,  ds_list_find_value(skinList, characterSelect), 1)
        draw_sprite_ext(MenuArmSkinSpr ,0, drawStartx+sprite_get_width(MenuBodySpr)*characterSize/2+sprite_get_height(MenuArmSpr)*characterSize/4, drawCharactery + sprite_get_height(MenuBodySpr)*characterSize/2 + (headSize-6)*characterSize/2, characterSize, characterSize, 280, ds_list_find_value(skinList, characterSelect), 1) 
        draw_sprite_ext(MenuHandSkinSpr, 0, drawStartx-sprite_get_width(MenuBodySpr)*characterSize/2-sprite_get_height(MenuArmSpr)*characterSize/2, drawCharactery + sprite_get_height(MenuBodySpr)*characterSize/2 + (headSize-6)*characterSize/2 + sprite_get_width(MenuArmSpr)*characterSize, characterSize, -characterSize, 270, ds_list_find_value(skinList, characterSelect), 1) 
        draw_sprite_ext(MenuHandSkinSpr, 0, drawStartx+sprite_get_width(MenuBodySpr)*characterSize/2+sprite_get_height(MenuArmSpr)*characterSize/2-1, drawCharactery + sprite_get_height(MenuBodySpr)*characterSize/2 + (headSize-6)*characterSize/2 + sprite_get_width(MenuArmSpr)*characterSize, characterSize, characterSize, 270, ds_list_find_value(skinList, characterSelect), 1)  
        draw_sprite_ext(MenuLegSkinSpr, 0, drawStartx-sprite_get_width(MenuLegSpr)*characterSize/2, drawCharactery + sprite_get_height(MenuBodySpr)*characterSize + headSize*characterSize/2 + sprite_get_height(MenuLegSpr)*characterSize/2, -characterSize, characterSize, 0, ds_list_find_value(skinList, characterSelect), 1)
        draw_sprite_ext(MenuLegSkinSpr, 0, drawStartx+sprite_get_width(MenuLegSpr)*characterSize/2, drawCharactery + sprite_get_height(MenuBodySpr)*characterSize + headSize*characterSize/2 + sprite_get_height(MenuLegSpr)*characterSize/2, characterSize, characterSize, 0, ds_list_find_value(skinList, characterSelect), 1)
        draw_sprite_ext(MenuFootSkinSpr,0, drawStartx-sprite_get_width(MenuLegSpr)*characterSize/2, drawCharactery + sprite_get_height(MenuBodySpr)*characterSize + headSize*characterSize/2 + sprite_get_height(MenuLegSpr)*characterSize + sprite_get_height(MenuFootSpr)*characterSize/2, -characterSize, characterSize, 0, ds_list_find_value(skinList, characterSelect), 1)
        draw_sprite_ext(MenuFootSkinSpr, 0, drawStartx+sprite_get_width(MenuLegSpr)*characterSize/2, drawCharactery + sprite_get_height(MenuBodySpr)*characterSize + headSize*characterSize/2 + sprite_get_height(MenuLegSpr)*characterSize + sprite_get_height(MenuFootSpr)*characterSize/2, characterSize, characterSize, 0, ds_list_find_value(skinList, characterSelect), 1) 
        draw_sprite_ext(MenuBodySkinSpr, 0, drawStartx, drawCharactery + sprite_get_height(MenuBodySpr)*characterSize/2 + headSize*characterSize/2, characterSize, characterSize, 0, ds_list_find_value(skinList, characterSelect), 1)
		
		
        draw_sprite_ext(MenuArmSpr, ds_list_find_value(shirtList, characterSelect), drawStartx-sprite_get_width(MenuBodySpr)*characterSize/2-sprite_get_height(MenuArmSpr)*characterSize/3, drawCharactery + sprite_get_height(MenuBodySpr)*characterSize/2 + (headSize-6)*characterSize/2, characterSize, -characterSize, 260, -1, 1)
        draw_sprite_ext(MenuArmSpr, ds_list_find_value(shirtList, characterSelect), drawStartx+sprite_get_width(MenuBodySpr)*characterSize/2+sprite_get_height(MenuArmSpr)*characterSize/4, drawCharactery + sprite_get_height(MenuBodySpr)*characterSize/2 + (headSize-6)*characterSize/2, characterSize, characterSize, 280, -1, 1) 
        draw_sprite_ext(MenuHandSpr, ds_list_find_value(shirtList, characterSelect), drawStartx-sprite_get_width(MenuBodySpr)*characterSize/2-sprite_get_height(MenuArmSpr)*characterSize/2, drawCharactery + sprite_get_height(MenuBodySpr)*characterSize/2 + (headSize-6)*characterSize/2 + sprite_get_width(MenuArmSpr)*characterSize, characterSize, -characterSize, 270, -1, 1) 
        draw_sprite_ext(MenuHandSpr, ds_list_find_value(shirtList, characterSelect), drawStartx+sprite_get_width(MenuBodySpr)*characterSize/2+sprite_get_height(MenuArmSpr)*characterSize/2-1, drawCharactery + sprite_get_height(MenuBodySpr)*characterSize/2 + (headSize-6)*characterSize/2 + sprite_get_width(MenuArmSpr)*characterSize, characterSize, characterSize, 270, -1, 1)  
        draw_sprite_ext(MenuLegSpr, ds_list_find_value(pantsList, characterSelect), drawStartx-sprite_get_width(MenuLegSpr)*characterSize/2, drawCharactery + sprite_get_height(MenuBodySpr)*characterSize + headSize*characterSize/2 + sprite_get_height(MenuLegSpr)*characterSize/2, -characterSize, characterSize, 0, -1, 1)
        draw_sprite_ext(MenuLegSpr, ds_list_find_value(pantsList, characterSelect), drawStartx+sprite_get_width(MenuLegSpr)*characterSize/2, drawCharactery + sprite_get_height(MenuBodySpr)*characterSize + headSize*characterSize/2 + sprite_get_height(MenuLegSpr)*characterSize/2, characterSize, characterSize, 0, -1, 1)
        draw_sprite_ext(MenuFootSpr, ds_list_find_value(pantsList, characterSelect), drawStartx-sprite_get_width(MenuLegSpr)*characterSize/2, drawCharactery + sprite_get_height(MenuBodySpr)*characterSize + headSize*characterSize/2 + sprite_get_height(MenuLegSpr)*characterSize + sprite_get_height(MenuFootSpr)*characterSize/2, -characterSize, characterSize, 0, -1, 1)
        draw_sprite_ext(MenuFootSpr, ds_list_find_value(pantsList, characterSelect), drawStartx+sprite_get_width(MenuLegSpr)*characterSize/2, drawCharactery + sprite_get_height(MenuBodySpr)*characterSize + headSize*characterSize/2 + sprite_get_height(MenuLegSpr)*characterSize + sprite_get_height(MenuFootSpr)*characterSize/2, characterSize, characterSize, 0, -1, 1) 
        draw_sprite_ext(MenuBodySpr, ds_list_find_value(shirtList, characterSelect), drawStartx, drawCharactery + sprite_get_height(MenuBodySpr)*characterSize/2 + headSize*characterSize/2, characterSize, characterSize, 0, -1, 1)
        draw_sprite_ext(MenuHeadSpr, ds_list_find_value(headList, characterSelect), drawStartx+1, drawCharactery, characterSize, characterSize, 0, -1, 1)
        
        draw_set_valign(fa_top)
		ds_list_replace(skinList, characterSelect, draw_getpixel(1920/960*(drawStartx - 6), 1080/540*(drawCharactery + 2)))
				
        ///Draw stuff
        for(i=0; i<7; i++)
            {
            if bindingSelect = i
                {
                if !changingBindings
                    draw_set_color(c_white)
                else
                    draw_set_color(make_color_rgb(215,0,0))
                
                }
            else
                draw_set_color(c_ltgray)
            switch(i)
                {
                case 0:
                    if bindingSelect != 0
                        {
                        draw_sprite_ext(MenuArrowSpr, 0, drawStartx-arrowWidth, menuButtonHeight[0], -1, 1, 0, c_ltgray, 1)
                        draw_sprite_ext(MenuArrowSpr, 0, drawStartx+arrowWidth, menuButtonHeight[0], 1, 1, 0, c_ltgray, 1)
                        }
                    else if checkLeftHeld
                        {
                        draw_sprite_ext(MenuArrowSpr, 0, drawStartx-arrowWidth, menuButtonHeight[0], -1, 1, 0, c_gray, 1)
                        draw_sprite_ext(MenuArrowSpr, 0, drawStartx+arrowWidth, menuButtonHeight[0], 1, 1, 0, c_white, 1)
                        }
                    else if checkRightHeld
                        {
                        draw_sprite_ext(MenuArrowSpr, 0, drawStartx-arrowWidth, menuButtonHeight[0], -1, 1, 0, c_white, 1)
                        draw_sprite_ext(MenuArrowSpr, 0, drawStartx+arrowWidth, menuButtonHeight[0], 1, 1, 0, c_gray, 1)
                        }
                    else
                        {
                        draw_sprite_ext(MenuArrowSpr, 0, drawStartx-arrowWidth, menuButtonHeight[0], -1, 1, 0, c_white, 1)
                        draw_sprite_ext(MenuArrowSpr, 0, drawStartx+arrowWidth, menuButtonHeight[0], 1, 1, 0, c_white, 1)
                        }
                    break;
                case 1:
                    if bindingSelect != 1
                        {
                        draw_sprite_ext(MenuArrowSpr, 0, drawStartx-arrowWidth, menuButtonHeight[1], -1, 1, 0, c_ltgray, 1)
                        draw_sprite_ext(MenuArrowSpr, 0, drawStartx+arrowWidth, menuButtonHeight[1], 1, 1, 0, c_ltgray, 1)
                        }
                    else if checkLeftHeld
                        {
                        draw_sprite_ext(MenuArrowSpr, 0, drawStartx-arrowWidth, menuButtonHeight[1], -1, 1, 0, c_gray, 1)
                        draw_sprite_ext(MenuArrowSpr, 0, drawStartx+arrowWidth, menuButtonHeight[1], 1, 1, 0, c_white, 1)
                        }
                    else if checkRightHeld
                        {
                        draw_sprite_ext(MenuArrowSpr, 0, drawStartx-arrowWidth, menuButtonHeight[1], -1, 1, 0, c_white, 1)
                        draw_sprite_ext(MenuArrowSpr, 0, drawStartx+arrowWidth, menuButtonHeight[1], 1, 1, 0, c_gray, 1)
                        }
                    else
                        {
                        draw_sprite_ext(MenuArrowSpr, 0, drawStartx-arrowWidth, menuButtonHeight[1], -1, 1, 0, c_white, 1)
                        draw_sprite_ext(MenuArrowSpr, 0, drawStartx+arrowWidth, menuButtonHeight[1], 1, 1, 0, c_white, 1)
                        }
                    break;
                case 2:
                    if bindingSelect != 2
                        {
                        draw_sprite_ext(MenuArrowSpr, 0, drawStartx-arrowWidth, menuButtonHeight[2], -1, 1, 0, c_ltgray, 1)
                        draw_sprite_ext(MenuArrowSpr, 0, drawStartx+arrowWidth, menuButtonHeight[2], 1, 1, 0, c_ltgray, 1)
                        }
                    else if checkLeftHeld
                        {
                        draw_sprite_ext(MenuArrowSpr, 0, drawStartx-arrowWidth, menuButtonHeight[2], -1, 1, 0, c_gray, 1)
                        draw_sprite_ext(MenuArrowSpr, 0, drawStartx+arrowWidth, menuButtonHeight[2], 1, 1, 0, c_white, 1)
                        }
                    else if checkRightHeld
                        {
                        draw_sprite_ext(MenuArrowSpr, 0, drawStartx-arrowWidth, menuButtonHeight[2], -1, 1, 0, c_white, 1)
                        draw_sprite_ext(MenuArrowSpr, 0, drawStartx+arrowWidth, menuButtonHeight[2], 1, 1, 0, c_gray, 1)
                        }
                    else
                        {
                        draw_sprite_ext(MenuArrowSpr, 0, drawStartx-arrowWidth, menuButtonHeight[2], -1, 1, 0, c_white, 1)
                        draw_sprite_ext(MenuArrowSpr, 0, drawStartx+arrowWidth, menuButtonHeight[2], 1, 1, 0, c_white, 1)
                        }
                    break;
                case 3:
                    draw_set_halign(fa_left);
                    draw_text(drawStartx - bindingDrawDistance , menuButtonHeight[3], string_hash_to_newline("LEFT:"));
                    draw_set_halign(fa_right);
                    if ds_list_find_value(joyStickList, characterSelect)
                        draw_text(drawStartx + bindingDrawDistance , menuButtonHeight[3], string_hash_to_newline("JOYSTICK"));
                    else if ds_list_find_value(buttonDisplayList[0], characterSelect) == -1
                        draw_text(drawStartx + bindingDrawDistance , menuButtonHeight[3], string_hash_to_newline("NONE"))
                    else if 48 < ds_list_find_value(buttonDisplayList[0], characterSelect) and ds_list_find_value(buttonDisplayList[0], characterSelect) < 91
                        draw_text(drawStartx + bindingDrawDistance , menuButtonHeight[3], string_hash_to_newline(chr(ds_list_find_value(buttonDisplayList[0], characterSelect))))
                    else if !is_undefined(ds_map_find_value(keyNames, ds_list_find_value(buttonDisplayList[0], characterSelect)))
                        draw_text(drawStartx + bindingDrawDistance , menuButtonHeight[3], string_hash_to_newline(ds_map_find_value(keyNames, ds_list_find_value(buttonDisplayList[0], characterSelect))))
                    else 
                        draw_text(drawStartx + bindingDrawDistance , menuButtonHeight[3], string_hash_to_newline("INPT" + string(ds_list_find_value(buttonDisplayList[0], characterSelect))))
                    break;
                    
                case 4:
                    draw_set_halign(fa_left);
                    draw_text(drawStartx - bindingDrawDistance , menuButtonHeight[4], string_hash_to_newline("RIGHT:"));
                    draw_set_halign(fa_right);
                    if ds_list_find_value(joyStickList, characterSelect)
                        draw_text(drawStartx + bindingDrawDistance , menuButtonHeight[4], string_hash_to_newline("JOYSTICK"));
                    else if ds_list_find_value(buttonDisplayList[1], characterSelect) == -1
                        draw_text(drawStartx + bindingDrawDistance , menuButtonHeight[4], string_hash_to_newline("NONE"))
                    else if 48 < ds_list_find_value(buttonDisplayList[1], characterSelect) and ds_list_find_value(buttonDisplayList[1], characterSelect) < 91
                        draw_text(drawStartx + bindingDrawDistance , menuButtonHeight[4], string_hash_to_newline(chr(ds_list_find_value(buttonDisplayList[1], characterSelect))))
                    else if !is_undefined(ds_map_find_value(keyNames, ds_list_find_value(buttonDisplayList[1], characterSelect)))
                        draw_text(drawStartx + bindingDrawDistance , menuButtonHeight[4], string_hash_to_newline(ds_map_find_value(keyNames, ds_list_find_value(buttonDisplayList[1], characterSelect))))
                    else 
                        draw_text(drawStartx + bindingDrawDistance , menuButtonHeight[4], string_hash_to_newline("INPT" + string(ds_list_find_value(buttonDisplayList[1], characterSelect))))
                    break;
                case 5:
                    draw_set_halign(fa_left);
                    draw_text(drawStartx - bindingDrawDistance , menuButtonHeight[5], string_hash_to_newline("JUMP:"));
                    draw_set_halign(fa_right);
                    if ds_list_find_value(buttonDisplayList[2], characterSelect) == -1
                        draw_text(drawStartx + bindingDrawDistance , menuButtonHeight[5], string_hash_to_newline("NONE"))
                    else if 48 < ds_list_find_value(buttonDisplayList[2], characterSelect) and ds_list_find_value(buttonDisplayList[2], characterSelect) < 91
                        draw_text(drawStartx + bindingDrawDistance , menuButtonHeight[5], string_hash_to_newline(chr(ds_list_find_value(buttonDisplayList[2], characterSelect))))
                    else if !is_undefined(ds_map_find_value(keyNames, ds_list_find_value(buttonDisplayList[2], characterSelect)))
                        draw_text(drawStartx + bindingDrawDistance , menuButtonHeight[5], string_hash_to_newline(ds_map_find_value(keyNames, ds_list_find_value(buttonDisplayList[2], characterSelect))))
                    else 
                        draw_text(drawStartx + bindingDrawDistance , menuButtonHeight[5], string_hash_to_newline("INPT" + string(ds_list_find_value(buttonDisplayList[2], characterSelect))))
                    break;
                case 6:
                    draw_set_halign(fa_left);
                    draw_text(drawStartx - bindingDrawDistance , menuButtonHeight[6], string_hash_to_newline("ACTION:"));
                    draw_set_halign(fa_right);
                    if ds_list_find_value(buttonDisplayList[3], characterSelect) == -1
                        draw_text(drawStartx + bindingDrawDistance , menuButtonHeight[6], string_hash_to_newline("NONE"))
                    else if 48 < ds_list_find_value(buttonDisplayList[3], characterSelect) and ds_list_find_value(buttonDisplayList[3], characterSelect) < 91
                        draw_text(drawStartx + bindingDrawDistance , menuButtonHeight[6], string_hash_to_newline(chr(ds_list_find_value(buttonDisplayList[3], characterSelect))))
                    else if !is_undefined(ds_map_find_value(keyNames, ds_list_find_value(buttonDisplayList[3], characterSelect)))
                        draw_text(drawStartx + bindingDrawDistance , menuButtonHeight[6], string_hash_to_newline(ds_map_find_value(keyNames, ds_list_find_value(buttonDisplayList[3], characterSelect))))
                    else 
                        draw_text(drawStartx + bindingDrawDistance , menuButtonHeight[6], string_hash_to_newline("INPT" + string(ds_list_find_value(buttonDisplayList[3], characterSelect))))
                    break;
                }
            }
            
        //Draw character input type text
        draw_set_halign(fa_center)
        draw_set_color(make_color_rgb(170,170,0)) 
               
        draw_set_font(mainSmallFont)
        if ds_list_find_value(inputControllerList, characterSelect) == true
            {
            draw_text(drawStartx, drawStarty - 171, string_hash_to_newline("CONTROLLER INPUT"))
            draw_set_color(c_gray)
            draw_text(drawStartx, drawStarty + 35, string_hash_to_newline("rebind with <button1>"))
            draw_text(drawStartx, drawStarty + 143, string_hash_to_newline("exit with <button2>"))
            draw_text(drawStartx, drawStarty + 155, string_hash_to_newline("delete with <button4>"))
            }
        else
            {
            draw_text(drawStartx, drawStarty - 171, string_hash_to_newline("KEYBOARD INPUT"))
            draw_set_color(c_gray)
            draw_text(drawStartx, drawStarty + 35, string_hash_to_newline("rebind with <enter>"))
            draw_text(drawStartx, drawStarty + 143, string_hash_to_newline("exit with <escape>"))
            draw_text(drawStartx, drawStarty + 155, string_hash_to_newline("delete with <delete>"))
            }
        draw_set_font(mainFont)
        }
    }
    
if room == MenuRoom or room == GolfMenuRoom{
    frameX = 435
    frameY = standDef + sprite_get_height(MenuStandSpr) - sprite_get_height(StandBackgroundSpr)/2 + 4
    nameTop = 85
    nameDistance = 36
    nameLeft = 60
    draw_sprite(CharacterListSpr, 0, frameX, frameY)
    
    //if room == MenuRoom
       // draw_sprite_ext(PartyPackSmallSpr, 1, frameX + 300, frameY - 35, 0.9 + cos((current_time/1000))*0.02, 0.9 + cos((current_time/1000))*0.02, 0, c_white, 1)   
    //if room == GolfMenuRoom 
       // draw_sprite_ext(PartyPackSmallSpr, 2, frameX + 300, frameY - 15, 0.9 + cos((current_time/1000))*0.02, 0.9 + cos((current_time/1000))*0.02, 0, c_white, 1)   
    
    for(i=0; i<ds_list_size(scores); i++){
        draw_set_color(characterColors[i])
        draw_set_halign(fa_left)
        draw_set_valign(fa_middle)
        draw_text(frameX - nameLeft, frameY - nameTop + nameDistance * i, string_hash_to_newline("PLAYER " + string(i+1)))
        draw_sprite_ext(HeadSpr, ds_list_find_value(headList, i), frameX - nameLeft - 15, frameY - nameTop + nameDistance * i, 1, 1, 0, c_white, 1)
        }
    }

///Draw Helpful Text



