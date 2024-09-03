function BreakAllow() {
    
	with Pirate 
		if irandom(1){
			UpdateMorale(-1,global.FEARSOME)
			UpdateMorale(-1,global.DARING)
		}
    
	with myPirate{
	    UpdateMorale(1, global.JOLLY)
	    }
    
	ds_list_add(global.notificationList, "restful break", "some of the crew were annoyed, but " + myPirate.firstName + " had a nice nap.")
}
