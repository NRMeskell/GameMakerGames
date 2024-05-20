function PartyCrew(argument0) {
	//Ambushed

	with instance_create(0,0,Request)
	    {
	    myPirate = argument0
	    buttonNumber = 2
	    ds_list_add(buttons, PartyAllow)
     
	    global.allowSelect = false
	    eventText = "I'm in the mood for celebrations! May I have some grog to throw a party?"
	    global.moraleBoost = "party"
	    }




}
