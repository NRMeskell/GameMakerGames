/// @description Over Buttons

overClose = point_in_circle(mouse_x, mouse_y, closeX, closeY, 10)

if viewed and !instance_exists(DumpItem)
    {
    if point_in_rectangle(mouse_x, mouse_y, drawX - 20, drawY - 19, drawX + 125, drawY + 20)
        {
        if !Store.previewItem
            {
            preview = true
            overButton = true
            }
            
        if mouse_check_button_pressed(mb_left)// and object_index != StoreObjectStorable
            {
            if previewSelect
                previewSelect = false
            else
                {
                with StoreObjectParent
                    previewSelect = false
                previewSelect = true
                }
            audio_play_sound(OpenMenuSnd,1, false)
            }
        }
    else
        {
        overButton = false
        preview = false
        }
        
    if point_in_rectangle(mouse_x, mouse_y, drawX + 130, drawY - 15, drawX + 160, drawY + 15)
        {
        if mouse_check_button_pressed(mb_left)// and (object_index != StoreObjectTrade or HasStored(type, storeAmount))
            {
            if selected
                {
                selected = false
                closeSound = audio_play_sound(StoreSelectSnd,1, false)
                audio_sound_pitch(closeSound, 0.8)
                }
            else
                {
                if !myStore.allowManySelects
                    StoreObjectParent.selected = false
                selected = true
                audio_play_sound(StoreSelectSnd,1, false)
                }
            }
        }
    }
    
if previewSelect
    preview = true

