/// @description Close Store

with StoreObjectParent  
    {
    viewed = false
    selected = false
    preview = false
    previewSelect = false
	if global.inPort == false
		instance_destroy()
	if object_index == StoreObjectPirate{
		instance_deactivate_object(myHat)
		instance_deactivate_object(myShirt)
		instance_deactivate_object(myPants)
		instance_deactivate_object(myPet)
		instance_deactivate_object(myRightHand)
		instance_deactivate_object(myLeftHand)
	}
		
	instance_deactivate_object(id)
}


audio_play_sound(CloseMenuSound, 1, false)
    
with StoreAreYouSure
    instance_destroy()
    
instance_destroy()

