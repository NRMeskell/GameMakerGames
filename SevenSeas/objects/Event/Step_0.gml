/// @description Button Pressed

buttonNumber = ds_list_size(buttons)

for(i=-buttonNumber; i < buttonNumber; i+=2) 
    {
    overButton[(i+buttonNumber)/2] = point_in_rectangle(window_view_mouse_get_x(0), window_view_mouse_get_y(0), drawX - sprite_get_width(ButtonSpr)/2, drawY + buttonCenter + i*(buttonSpacing) - sprite_get_height(ButtonSpr)/2, drawX + sprite_get_width(ButtonSpr)/2, drawY + buttonCenter + i*(buttonSpacing) + sprite_get_height(ButtonSpr)/2) and !instance_exists(DumpItem)
    }

for(r=0; r<buttonNumber; r++)
    {   
    requiredAmount = ds_list_find_value(buttonRequires, r)
    requiredCost = ds_list_find_value(buttonCosts, r)
    haveAmount = (requiredAmount == 0) ? 1 : Ship.myStatsNumList[ds_list_find_value(buttonStats, r)]
    haveCost = CargoAmount(ds_list_find_value(buttonStats, r))
    successChance  = (requiredAmount == 0) ? 100 : min(round(200/(1+exp(-(haveAmount/requiredAmount-0.6)*4)) div 2), 99)
         
    if mouse_check_button_pressed(mb_left)
        {                                       
        if overButton[r] and requiredCost <= haveCost
            {
			try{
	            LoseCargo(ds_list_find_value(buttonStats, r), requiredCost)
				
				var success = (successChance >= random(99)+1)
	            script_execute(ds_list_find_value(buttons, r), success, eventValue)
				if success
					audio_play_sound(StoreSelectSnd, 1, false)
				else
					audio_play_sound(StoreSelectSnd, 1, false)
				}
			catch( _exception){
				showException( _exception)
				}
			if !instance_exists(CrashingRocksEvent) and !instance_exists(FogEvent)
				closeEventCode()
			}
        }
    }

