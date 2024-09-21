/// @description Fall

if dropSpeed != 0{
    dropSpeed += myGrav
    y += dropSpeed
    }

if y > dropY{
    if dropSpeed < 0.05{
        y = dropY
        dropSpeed = 0
        }
    else
        {
        y = dropY
        dropSpeed = -dropSpeed/4
        }
    }
    
if y > room_height + 100
    instance_destroy()


///Check Buttons

if y = dropY and !instance_exists(DumpItem){
    overLeftUp = point_in_rectangle(mouse_x, mouse_y, x-farHor, y-farVer, x-nearHor, y-nearVer) 
    overLeftDown = point_in_rectangle(mouse_x, mouse_y, x-farHor, y+nearVer, x-nearHor, y+farVer) 
    overRightUp = point_in_rectangle(mouse_x, mouse_y, x+nearHor, y-farVer, x+farHor, y-nearVer)
    overRightDown = point_in_rectangle(mouse_x, mouse_y, x+nearHor, y+nearVer, x+farHor, y+farVer)
    overBack = point_in_rectangle(mouse_x, mouse_y, x-lowButtonFar, y+lowButtonTop, x-lowButtonNear, y+lowButtonBottom)
    overEnter = point_in_rectangle(mouse_x, mouse_y, x+lowButtonNear, y+lowButtonTop, x+lowButtonFar, y+lowButtonBottom)
    
    if overLeftUp image_index = 1
    else if overRightUp image_index = 2
    else if overLeftDown image_index = 3
    else if overRightDown image_index = 4
    else if overBack image_index = 5
    else if overEnter image_index = 6
    else image_index = 0
    }
else{
    overLeftUp = false
    overLeftDown = false
    overRightUp = false
    overRightDown = false
    overBack = false
    overEnter = false
    }

///Change Arrows

if mouse_check_button_pressed(mb_left){
    //check left arrows pressed
    if drawFirstY = 0{
        if overLeftUp{
			audio_play_sound(OpenMapSnd, 1, false)
            drawFirstY = drawDistance
            currentFirst --
            }
            
        if overLeftDown{
			audio_play_sound(OpenMapSnd, 1, false)
            drawFirstY = -drawDistance
            currentFirst ++
            }
        }
        
    //check right arrows pressed
    if drawSecondY = 0{
        if overRightUp{
			audio_play_sound(OpenMapSnd, 1, false)
            drawSecondY = drawDistance
            currentLast --
            }
        if overRightDown{
			audio_play_sound(OpenMapSnd, 1, false)
            drawSecondY = -drawDistance
            currentLast ++
            }
        }
        
    if currentFirst < 0
        currentFirst = ds_list_size(firstNames) - 1
    if currentFirst = ds_list_size(firstNames)
        currentFirst = 0
        
    if currentLast < 0
        currentLast = ds_list_size(lastNames) - 1
    if currentLast = ds_list_size(lastNames)
        currentLast = 0
    }
    
if drawFirstY != 0{
    drawFirstY -= sign(drawFirstY)*drawSpeed
    }
if drawSecondY != 0{
    drawSecondY -= sign(drawSecondY)*drawSpeed
    }

///Click Buttons

if mouse_check_button_pressed(mb_left){
    if overBack{
		audio_play_sound(StoreSelectSnd, 1, false)
            
        dropY = room_height*2
        dropSpeed = 2
        with MenuButtonMaker
            event_user(0)
        }
    if overEnter{
		audio_play_sound(StoreSelectSnd, 1, false)
        SaveGameRunner.gameName = ds_list_find_value(firstNames, currentFirst) + " " + ds_list_find_value(lastNames, currentLast)
        with instance_create(0,0,LoadingScreenWaves)
            myEvent = 1
        dropY = room_height*2
        dropSpeed = 2
        
        AddSaveFile(SaveGameRunner.gameName)
        }
    }

