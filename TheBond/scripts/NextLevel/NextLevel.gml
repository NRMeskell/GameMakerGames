function NextLevel() {
	//Next

	if ds_list_find_index(GameRunner.levelList, room) + 1 < ds_list_size(GameRunner.levelList) 
	    room = ds_list_find_value(GameRunner.levelList, ds_list_find_index(GameRunner.levelList, room) + 1)
	else
	    {
	    room = MenuRoom
	    OpenCredits()
	    }
	audio_stop_sound(Birds)



}
