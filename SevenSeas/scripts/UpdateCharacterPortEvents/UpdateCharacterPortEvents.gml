function UpdateCharacterPortEvents() {
	ds_list_clear(myPortEvents)
	for(i=0; i<argument_count; i++)
	    {
	    ds_list_add(myPortEvents, argument[i])
	    }



}
