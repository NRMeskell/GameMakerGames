/// @description Close Store

with StoreObjectParent  
    {
    viewed = false
    selected = false
    preview = false
    previewSelect = false
	instance_deactivate_object(id)
	if global.inPort == false
		instance_destroy()
    }


audio_play_sound(CloseMenuSound, 1, false)
    
with StoreAreYouSure
    instance_destroy()
    
instance_destroy()

