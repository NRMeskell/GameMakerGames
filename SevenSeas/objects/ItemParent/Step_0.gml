/// @description Buttons

if mouse_check_button_pressed(mb_left) and !instance_exists(DumpItem)
    {
    if overLeft and !instance_exists(Event) and !instance_exists(CombatRunner) and !instance_exists(Store)
        {
        if state == "equipped"
            {
            //UnequipItem(id)
            //audio_play_sound(CloseMenuSound, 1, false)
            }
        else if canEquip
            {
            with Pirate
                if selected
                    {
                    EquipItem(id, other.id)
                    audio_play_sound(CloseMenuSound, 1, false)
                    }
            }
        }
    if overRight
        {
        if state == "equipped"
            {
            //selected = false
            //audio_play_sound(CloseMenuSound, 1, false)
            }
        else
            {
            UnequipItem(id)  
            audio_play_sound(CloseMenuSound, 1, false)
            while ds_list_find_index(ItemRunner.floatingItems, id) != -1
                ds_list_delete(ItemRunner.floatingItems, ds_list_find_index(ItemRunner.floatingItems, id))
            event_user(1)
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
