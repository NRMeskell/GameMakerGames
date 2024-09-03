function StolenJournal(argument0) {
	//Ambushed

	with instance_create(0,0,Request)
	    {
	    myPirate = argument0    
	    buttonNumber = 2
	    ds_list_add(buttons, JournalAllow)
     
	    global.allowSelect = false
	    eventText = "'My journal went missing! It's full of great ideas, so can I search everyone's bunks?'"
	    global.moraleBoost = "journal"
	    }




}
