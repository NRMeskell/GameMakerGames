/// @description Buttons
						
if mouse_check_button_pressed(mb_left) and !instance_exists(DumpItem)
    {
	if ds_list_find_value(ItemRunner.floatingItems, 0) == id
	    {
	    if overLeft and !global.eventOpen and !instance_exists(CombatRunner) and !instance_exists(Store)
	        {
	        with Pirate
	            if selected
	                {
	                EquipItem(id, other.id)
	                audio_play_sound(CloseMenuSound, 1, false)
	                }
	        }
	    if overRight
	        {
	        UnequipItem(id)
	        while ds_list_find_index(ItemRunner.floatingItems, id) != -1
	            ds_list_delete(ItemRunner.floatingItems, ds_list_find_index(ItemRunner.floatingItems, id))
	        if AbleToStore(1, 1){
				audio_play_sound(StoreBuySnd, 1, false)
				StoreCargo(1, 1)
			}
			else
				audio_play_sound(CloseMenuSound, 1, false)
			instance_destroy()
	        }
		}
    }

///Delete Floating Empty

if itemName = "none" and ds_list_find_index(ItemRunner.floatingItems, id) != -1
    {
    while ds_list_find_index(ItemRunner.floatingItems, id) != -1
        ds_list_delete(ItemRunner.floatingItems, ds_list_find_index(ItemRunner.floatingItems, id))
    instance_destroy()
    }
