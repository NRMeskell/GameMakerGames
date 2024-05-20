function UpdateCharacterEvents() {
	ds_list_clear(myEvents)
	for(i=0; i<argument_count; i++)
	    {
	    ds_list_add(myEvents, argument[i])
	    }
}
