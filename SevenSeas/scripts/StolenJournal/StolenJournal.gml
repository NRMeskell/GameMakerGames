function StolenJournal(argument0) {
	//Ambushed

	with instance_create(0,0,Request)
	    {
	    myPirate = argument0    
	    buttonNumber = 2
	    ds_list_add(buttons, JournalAllow)
     
	    global.allowSelect = false
	    eventText = "My journal went missing, and I don't want anyone to see it! Can I search everyone's bunks?"
	    global.moraleBoost = "journal"
	    }




}
