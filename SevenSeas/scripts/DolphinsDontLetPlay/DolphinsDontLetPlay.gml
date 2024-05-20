function DolphinsDontLetPlay() {
	//Dont let play
	
	if argument0{
		with Pirate 
		    {
			UpdateMorale(-1, -1)
		    UpdateMorale(-1, global.DARING) 
			UpdateMorale(1, global.FEARSOME)
		    }
        
		captionText = "The crew be disappointed!"
		notiText = "They reluctently obey the orders and maintain their positions!"

		ds_list_add(global.notificationList, captionText, notiText)

		instance_destroy(Dolphins)
		script_execute(closeEventCode)
	}
	else{
		UpdateMorale(-1, -1)
		
		DolphinsLetCrewPlay()
		ds_list_replace(global.notificationList, 0, "The crew ignore the command, and begin to play!")
	}

}
