function InstrumentAllow() {

	if irandom(1)
	    {
	    ds_list_add(global.notificationList, "successful concert!", "the concert was great, and the crew had a grand time!")
	    with Pirate
	        {
	        UpdateMorale(1, global.JOLLY)
	        UpdateMorale(1, global.KEEN)
	        }
	    }
	else
	    {
	    ds_list_add(global.notificationList, "unsuccessful concert!", "the concert was an hour of horrible music.")
	    with Pirate
	        {
	        UpdateMorale(-1, global.KEEN)
	        UpdateMorale(-1, global.FEARSOME)
	        }
	    }
    



}
