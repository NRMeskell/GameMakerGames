/// @description global clicking


global.selectClick = false
if mouse_check_button_pressed(mb_left)
    global.selectClick = true

for(i=0; i < gamepad_get_device_count(); i++)
    if gamepad_button_check_pressed(i, gp_face1)
        global.selectClick = true
        

///Start Character Creation

if creatingCharacter = false and ds_list_size(joyStickList) < 6 and room == PartyPackRoom
    {
    if keyboard_check_released(vk_enter)
        {
        characterSelect = ds_list_size(inputControllerList)
        ds_list_add(joyStickList, false)
        ds_list_add(inputControllerList, false)
        ds_list_add(controllerInputNumList, 0)
        ds_list_add(leftButtonList, -1)
        ds_list_add(rightButtonList, -1)
        ds_list_add(upButtonList, -1)
        ds_list_add(throwButtonList, -1)
        ds_list_add(headList, 0)
        ds_list_add(shirtList, 0)
        ds_list_add(pantsList, 0)
		ds_list_add(skinList, 0)
        creatingCharacter = true
        bindingSelect = 0
        ds_list_add(scores, 0)
        ds_list_add(totalScores, 0)   
        }
        
    for(i=0; i<gamepad_get_device_count(); i++)
        if gamepad_button_check_pressed(i, gp_face4) or gamepad_button_check_pressed(i, gp_padu)
            {
            characterSelect = ds_list_size(inputControllerList)
            ds_list_add(joyStickList, false)
            ds_list_add(inputControllerList, true)
            ds_list_add(controllerInputNumList, i)
            ds_list_add(leftButtonList, -1)
            ds_list_add(rightButtonList, -1)
            ds_list_add(upButtonList, -1)
            ds_list_add(throwButtonList, -1)
            ds_list_add(headList, 0)
            ds_list_add(shirtList, 0)
            ds_list_add(pantsList, 0)
			ds_list_add(skinList, 0)
            creatingCharacter = true
            bindingSelect = 0    
            ds_list_add(scores, 0)
            ds_list_add(totalScores, 0)   
            }
    }

///selectBindings
    

if creatingCharacter
    {	
    if ds_list_find_value(inputControllerList, characterSelect) == false
        {
        checkSelect = keyboard_check_pressed(vk_enter) or (mouse_check_button_pressed(mb_left) and abs(mouse_x - drawStartx) < arrowWidth+10 and mouse_y > menuButtonHeight[3] - 8 and mouse_y < menuButtonHeight[6] + 8)
        checkLeft = keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A")) or (mouse_check_button_pressed(mb_left) and abs(mouse_x - (drawStartx - arrowWidth)) < 10)
        checkRight = keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D")) or (mouse_check_button_pressed(mb_left) and abs(mouse_x - (drawStartx + arrowWidth)) < 10)
        checkDown = keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S"))
        checkUp = keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W"))
        randomizeChar = keyboard_check_pressed(vk_space)
        }
    else
        {
        checkSelect = gamepad_button_check_pressed(ds_list_find_value(controllerInputNumList, characterSelect), gp_face1)
        checkLeft = gamepad_button_check_pressed(ds_list_find_value(controllerInputNumList, characterSelect), gp_padl) or (gamepad_axis_value(ds_list_find_value(controllerInputNumList, characterSelect), gp_axislh) < -0.5 and stickCentered == true)
        checkRight = gamepad_button_check_pressed(ds_list_find_value(controllerInputNumList, characterSelect), gp_padr) or (gamepad_axis_value(ds_list_find_value(controllerInputNumList, characterSelect), gp_axislh) > 0.5 and stickCentered == true)
        checkDown = gamepad_button_check_pressed(ds_list_find_value(controllerInputNumList, characterSelect), gp_padd) or (gamepad_axis_value(ds_list_find_value(controllerInputNumList, characterSelect), gp_axislv) > 0.5 and stickCentered == true)
        checkUp = gamepad_button_check_pressed(ds_list_find_value(controllerInputNumList, characterSelect), gp_padu) or (gamepad_axis_value(ds_list_find_value(controllerInputNumList, characterSelect), gp_axislv) < -0.5 and stickCentered == true) 
        randomizeChar = gamepad_button_check_pressed(ds_list_find_value(controllerInputNumList, characterSelect), gp_face3)
        }
    
    
    if creatingCharacter  //Exit character creation
    {
    exitButton = (keyboard_check_pressed(vk_escape) and ds_list_find_value(inputControllerList, characterSelect) == false) or (gamepad_button_check_pressed(ds_list_find_value(controllerInputNumList, characterSelect), gp_face2) and ds_list_find_value(inputControllerList, characterSelect) == true)
    if exitButton and !changingBindings
        {
        creatingCharacter = false
        }
    }
    
    //Input using mouse
    deltax = abs(mouse_x - previousMouseX)
    deltay = abs(mouse_y - previousMouseY)
    previousMouseX = mouse_x
    previousMouseY = mouse_y
    if deltax > 0 or deltay > 0
        {
        for(i=0; i<7; i++)
            {
            if abs(menuButtonHeight[i] - mouse_y) < menuButtonWidth[i] and abs(mouse_x - drawStartx) < arrowWidth+10
                {
                if bindingSelect != i
                    {
                    bindingSelect = i
                    audio_play_sound(LightClickSound, 1, false)
                    }
                }
            }
        }
    
    controllerNumber = ds_list_find_value(controllerInputNumList, characterSelect) //input controller number
    
    if ds_list_find_value(inputControllerList, characterSelect) == false //check if using keyboard
        {
        if changingBindings == false
            {
            if randomizeChar{
                audio_play_sound(ClickSound, 1, false)
                ds_list_replace(headList, characterSelect, irandom(sprite_get_number(HeadSpr)-1))
                ds_list_replace(shirtList, characterSelect, irandom(sprite_get_number(BodySpr)-1))
                ds_list_replace(pantsList, characterSelect, irandom(sprite_get_number(LegSpr)-1))
            }
            
            if checkSelect and bindingSelect > 2 //Select binding for change
                {
                changingBindings = true
                audio_play_sound(LightClickSound, 1, false)
                }
            if checkLeft and bindingSelect <= 2 //change selection Type
                {
                audio_play_sound(ClickSound, 1, false)
                switch(bindingSelect)
                    {
                    case 0: ds_list_replace(headList, characterSelect, ds_list_find_value(headList, characterSelect) - 1); break;
                    case 1: ds_list_replace(shirtList, characterSelect, ds_list_find_value(shirtList, characterSelect) - 1); break;
                    case 2: ds_list_replace(pantsList, characterSelect, ds_list_find_value(pantsList, characterSelect) - 1); break;
                    }
                if ds_list_find_value(headList, characterSelect) < 0
                    ds_list_replace(headList, characterSelect, sprite_get_number(HeadSpr)-1)
                if ds_list_find_value(shirtList, characterSelect) < 0
                    ds_list_replace(shirtList, characterSelect, sprite_get_number(BodySpr)-1)
                if ds_list_find_value(pantsList, characterSelect) < 0
                    ds_list_replace(pantsList, characterSelect, sprite_get_number(LegSpr)-1)
										
				}
            if checkRight and bindingSelect <= 2 //change selection Type
                {
                audio_play_sound(ClickSound, 1, false)
                switch(bindingSelect)
                    {
                    case 0: ds_list_replace(headList, characterSelect, ds_list_find_value(headList, characterSelect) + 1); break;
                    case 1: ds_list_replace(shirtList, characterSelect, ds_list_find_value(shirtList, characterSelect) + 1); break;
                    case 2: ds_list_replace(pantsList, characterSelect, ds_list_find_value(pantsList, characterSelect) + 1); break;
                    }
                if ds_list_find_value(headList, characterSelect) > sprite_get_number(HeadSpr)-1
                    ds_list_replace(headList, characterSelect, 0)
                if ds_list_find_value(shirtList, characterSelect) > sprite_get_number(BodySpr)-1
                    ds_list_replace(shirtList, characterSelect, 0)
                if ds_list_find_value(pantsList, characterSelect) > sprite_get_number(LegSpr)-1
                    ds_list_replace(pantsList, characterSelect, 0)
					
				}
            if checkDown //change selection Type
                {
                bindingSelect ++
                if bindingSelect > 6
                    bindingSelect = 0
                audio_play_sound(LightClickSound, 1, false)
                }
            if checkUp //change selection Type
                {
                bindingSelect --
                if bindingSelect < 0
                    bindingSelect = 6
                audio_play_sound(LightClickSound, 1, false)
                }
            }
        else if keyboard_check_pressed(vk_anykey) //change binding
            {
            switch(bindingSelect)
                {
                case 3: ds_list_replace(leftButtonList, characterSelect, keyboard_key); break;
                case 4: ds_list_replace(rightButtonList, characterSelect, keyboard_key); break;
                case 5: ds_list_replace(upButtonList, characterSelect, keyboard_key); break;
                case 6: ds_list_replace(throwButtonList, characterSelect, keyboard_key); break;
                }
            changingBindings = false
            audio_play_sound(ClickSound, 1, false)
            }
        }
         
        
    if ds_list_find_value(inputControllerList, characterSelect) == true //check if using controller
        {     
        if abs(gamepad_axis_value(ds_list_find_value(controllerInputNumList, characterSelect), gp_axislv)) < 0.5 and abs(gamepad_axis_value(ds_list_find_value(controllerInputNumList, characterSelect), gp_axislh)) < 0.5
            {
            stickCentered = true
            }
            
        if changingBindings = false
            {
            if checkSelect and bindingSelect > 2 //Select binding for change
                {
                changingBindings = true
                }
            if checkLeft and bindingSelect <= 2 //change selection Type
                {
                switch(bindingSelect)
                    {
                    case 0: ds_list_replace(headList, characterSelect, ds_list_find_value(headList, characterSelect) - 1); break;
                    case 1: ds_list_replace(shirtList, characterSelect, ds_list_find_value(shirtList, characterSelect) - 1); break;
                    case 2: ds_list_replace(pantsList, characterSelect, ds_list_find_value(pantsList, characterSelect) - 1); break;
                    }
                if ds_list_find_value(headList, characterSelect) < 0
                    ds_list_replace(headList, characterSelect, sprite_get_number(HeadSpr)-1)
                if ds_list_find_value(shirtList, characterSelect) < 0
                    ds_list_replace(shirtList, characterSelect, sprite_get_number(BodySpr)-1)
                if ds_list_find_value(pantsList, characterSelect) < 0
                    ds_list_replace(pantsList, characterSelect, sprite_get_number(LegSpr)-1)
                    
                stickCentered = false
                }
            if checkRight and bindingSelect <= 2 //change selection Type
                {
                switch(bindingSelect)
                    {
                    case 0: ds_list_replace(headList, characterSelect, ds_list_find_value(headList, characterSelect) + 1); break;
                    case 1: ds_list_replace(shirtList, characterSelect, ds_list_find_value(shirtList, characterSelect) + 1); break;
                    case 2: ds_list_replace(pantsList, characterSelect, ds_list_find_value(pantsList, characterSelect) + 1); break;
                    }
                if ds_list_find_value(headList, characterSelect) > sprite_get_number(HeadSpr)-1
                    ds_list_replace(headList, characterSelect, 0)
                if ds_list_find_value(shirtList, characterSelect) > sprite_get_number(BodySpr)-1
                    ds_list_replace(shirtList, characterSelect, 0)
                if ds_list_find_value(pantsList, characterSelect) > sprite_get_number(LegSpr)-1
                    ds_list_replace(pantsList, characterSelect, 0)
                    
                stickCentered = false
                }
            if checkUp and stickCentered == true//change selection Type
                {
                bindingSelect --
                if bindingSelect < 0
                    bindingSelect = 6
                stickCentered = false
                }
            if checkDown and stickCentered == true//change selection Type
                {
                bindingSelect ++
                if bindingSelect > 6
                    bindingSelect = 0
                stickCentered = false
                }
            }
        else //change binding
            {
            anyPressed = 0  //check any gamepad button pressed
            for (i=gp_face1; i<gp_axisrv; i++)
                {
                if gamepad_button_check_pressed(ds_list_find_value(controllerInputNumList, characterSelect), i)
                    {
                    anyPressed = i;
                    }
                }
                
            if anyPressed
                {
                switch(bindingSelect)
                    {
                    case 3: ds_list_replace(leftButtonList, characterSelect, anyPressed); ds_list_replace(joyStickList, characterSelect, false); break;
                    case 4: ds_list_replace(rightButtonList, characterSelect, anyPressed); ds_list_replace(joyStickList, characterSelect, false); break;
                    case 5: ds_list_replace(upButtonList, characterSelect, anyPressed); break;
                    case 6: ds_list_replace(throwButtonList, characterSelect, anyPressed); break;
                    }
                changingBindings = false
                }  
                
            if abs(gamepad_axis_value(ds_list_find_value(controllerInputNumList, characterSelect), gp_axislh)) > 0.5
                {
                if bindingSelect == 4 or bindingSelect == 3
                    {
                    ds_list_replace(joyStickList, characterSelect, true)
                    changingBindings = false
                    }
                }
            }
        }
    }


///Room Controls

inMenu = ((room == MenuRoom) or (room == PartyPackRoom) or (room = TitleRoom) or (room == GolfMenuRoom))

if inMenu
    global.timeDiff = min(2, sqr(delta_time/(1/60*1000000)))

exitGame = false
if keyboard_check_pressed(vk_escape)
    exitGame = true

for(i=0; i < gamepad_get_device_count(); i++)
    if gamepad_button_check_pressed(i, gp_start)
        exitGame = true

if !inMenu and exitGame and global.gameMode == "dodgeball"
    {
    exitGame = false
    event_user(2)
    room_goto(MenuRoom)
    }
    
if !inMenu and exitGame and global.gameMode == "golf"
    {
    exitGame = false
    event_user(2)
    room_goto(GolfMenuRoom)
    }
    
if gameOver = true and !inMenu and alarm[1] < 1
    {
    if keyboard_check_pressed(vk_enter)
        event_user(1)
    
    for(i=0; i<gamepad_get_device_count(); i++)
        if gamepad_button_check_pressed(i, gp_face1)
            event_user(1)
    }
    
alarm[2] += 1-global.timeDiff

   ///Delete Character

///Start Character Creation

if creatingCharacter == true
    {
    for(var i=0; i<gamepad_get_device_count(); i++)
        if creatingCharacter and ((keyboard_check_pressed(vk_delete)) or (gamepad_button_check_pressed(i, gp_start)))
            {
            ds_list_delete(joyStickList, characterSelect)
            ds_list_delete(inputControllerList, characterSelect)
            ds_list_delete(controllerInputNumList, characterSelect)
            ds_list_delete(leftButtonList, characterSelect)
            ds_list_delete(rightButtonList, characterSelect)
            ds_list_delete(upButtonList, characterSelect)
            ds_list_delete(throwButtonList, characterSelect)
            ds_list_delete(headList, characterSelect)
            ds_list_delete(shirtList, characterSelect)
            ds_list_delete(pantsList, characterSelect)
            ds_list_delete(scores, characterSelect)
            ds_list_delete(totalScores, characterSelect)
			ds_list_delete(skinList, characterSelect)
            creatingCharacter = false
            bindingSelect = 0
            characterSelect = 0
            }
    }

///Select Character

if !creatingCharacter
    {
    mouseOverCharacter = -1
    for(i = 0; i<ds_list_size(inputControllerList); i++)
        {
        if abs(mouse_x - standx[i]) < 20 and mouse_y < standy[i] + standDef and mouse_y > standCharHead - 10
            mouseOverCharacter = i
        }
        
    if global.selectClick and mouseOverCharacter != -1
        {
        characterSelect = mouseOverCharacter
        creatingCharacter = true
        bindingSelect = 0
        }
     }   
     
if room != PartyPackRoom
    creatingCharacter = false

///Move mouse with controller

mouseSpeed = 7*global.timeDiff

if !creatingCharacter
    {
    for(i=0; i<gamepad_get_device_count(); i++)
        {
        if (abs(gamepad_axis_value(i, gp_axislh)) > 0.2 or abs(gamepad_axis_value(i, gp_axislv)) > 0.2) 
            window_mouse_set(window_mouse_get_x()+power(mouseSpeed*gamepad_axis_value(i, gp_axislh), 2)*sign(gamepad_axis_value(i, gp_axislh)), window_mouse_get_y()+power(mouseSpeed*gamepad_axis_value(i, gp_axislv), 2)*sign(gamepad_axis_value(i, gp_axislv)))
		else if (abs(gamepad_axis_value(i, gp_axisrh)) > 0.2 or abs(gamepad_axis_value(i, gp_axisrv)) > 0.2) 
            window_mouse_set(window_mouse_get_x()+power(mouseSpeed*gamepad_axis_value(i, gp_axisrh), 2)*sign(gamepad_axis_value(i, gp_axisrh)), window_mouse_get_y()+power(mouseSpeed*gamepad_axis_value(i, gp_axisrv), 2)*sign(gamepad_axis_value(i, gp_axisrv)))
		}
    }
    
if !inMenu
    cursor_sprite = noone
else
    cursor_sprite = MouseSpr

///End game in golf

if global.gameMode == "golf" and instance_number(CharacterController) == 0 and instance_exists(BallMarker) {
    if !gameOver
        event_user(0)
}

