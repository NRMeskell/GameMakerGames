function CheckersAllow() {   
		
    
	if otherPirate.myMainPer == global.FEARSOME and irandom(1){
		ds_list_add(global.notificationList, "upsetting game!", otherPirate.firstName + " is insulted by the odd methods, and declares that " + myPirate.firstName + " cheated!")
		with otherPirate
			UpdateMorale(-2, -1)
		with myPirate
			UpdateMorale(-2, -1)
	}
	else if otherPirate.myMainPer == global.KEEN{
		ds_list_add(global.notificationList, "grand game!", otherPirate.firstName + " enjoyed playing against the odd methods, and both players had a good time!")
		with otherPirate
			UpdateMorale(1, -1)
		with myPirate
			UpdateMorale(1, -1)
	}
	else{
		ds_list_add(global.notificationList, "quick game", otherPirate.firstName + " is thoroughly beaten. they both had a fine time, but " + myPirate.firstName + " is somewhat disappointed." )
		with otherPirate
			UpdateMorale(irandom(2)-1, -1)
		with myPirate
			UpdateMorale(-1, -1)
	}	
}
