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

farHor = 132
farVer = 48
nearHor = 102
nearVer = 20

returnWidth = 46
returnTop = 90
returnBottom = 115

if dropSpeed = 0 and !instance_exists(DumpItem){
    overUp = point_in_rectangle(window_view_mouse_get_x(0), window_view_mouse_get_y(0), x + nearHor, y - farVer, x + farHor, y - nearVer)
    overDown = point_in_rectangle(window_view_mouse_get_x(0), window_view_mouse_get_y(0), x + nearHor, y + nearVer, x + farHor, y + farVer)
    overBack = point_in_rectangle(window_view_mouse_get_x(0), window_view_mouse_get_y(0), x-returnWidth, y + returnTop, x+returnWidth, y+returnBottom)
    
    for(i=0; i<ds_list_size(myGames); i++){
        overButton[i] = point_in_rectangle(window_view_mouse_get_x(0), window_view_mouse_get_y(0), x-buttonAlign-15, y - buttonStartY + buttonDistance*(i-buttonPos)-14, x-buttonAlign-15+buttonSplit-8, y - buttonStartY + buttonDistance*(i-buttonPos)+14)
        overTrash[i] = point_in_rectangle(window_view_mouse_get_x(0), window_view_mouse_get_y(0), x-buttonAlign-15+buttonSplit+5, y - buttonStartY + buttonDistance*(i-buttonPos)-14, x-buttonAlign-15+buttonSplit+27, y - buttonStartY + buttonDistance*(i-buttonPos)+14)
        
		overButton[i] = overButton[i] && (i - buttonPos < 4) && (i - buttonPos >= 0)
		overTrash[i] = overTrash[i] && (i - buttonPos < 4) && (i - buttonPos >= 0)
		}
    }
else{
    overUp = false
    overDown = false
    overBack = false
    }

if overUp image_index = 1
else if overDown image_index = 2
else if overBack image_index = 3
else image_index = 0

///Click Buttons

if mouse_check_button_pressed(mb_left) and !instance_exists(DumpItem){
    if overUp{
		audio_play_sound(OpenMapSnd, 0, false)
        buttonPos --
        }
    if overDown{
		audio_play_sound(OpenMapSnd, 0, false)
        buttonPos ++
        }
    if overBack{
		audio_play_sound(StoreSelectSnd, 0, false)
        dropY = room_height*2
        dropSpeed = 2
        with MenuButtonMaker
            event_user(0)
        }


    for(r=0; r<ds_list_size(myGames); r++){
        if overButton[r]{
			SaveGameRunner.gameName = ds_list_find_value(myGames, r)
			if LoadFileExists(SaveGameRunner.gameName){
				saveFile = file_text_open_write("saveGames.txt")
				for(var i=ds_list_size(myGames)-1; i>=0; i--){
					if (i != r)  file_text_write_string(saveFile, ds_list_find_value(myGames, i) + "\n")
					}	
				file_text_write_string(saveFile, ds_list_find_value(myGames, r) + "\n")
				file_text_close(saveFile)
			
				audio_play_sound(StoreBuySnd, 0, false)
				with instance_create(0,0,LoadingScreenWaves)
	                myEvent = 2
				
	            dropY = room_height*2
	            dropSpeed = 2
				}
			else{
				with instance_create(0,0,DeleteAreYouSure){
					caption = "Save File Corrupt!"
					text = "This save cannot be loaded. Would you like to delete it?"
					myEvent = other.r
				}
			}
        }
        if overTrash[r]{
			with instance_create(0,0,DeleteAreYouSure){
				myEvent = other.r
			}
        }
    }
}
    
if (buttonPos + 4) > ds_list_size(myGames)
    buttonPos --
if buttonPos < 0
    buttonPos = 0
    

