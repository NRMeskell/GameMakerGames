function ShantiesAllow() {
    
	with Pirate{
	    UpdateMorale(-1,-1)
	    UpdateMorale(choose(0,2), global.JOLLY)
	    UpdateMorale(choose(-1,0), global.FEARSOME)
	    }
    
	with myPirate{
	    UpdateMorale(1, -1)
	    }

    
	ds_list_add(global.notificationList, "shanties sung!", "The crew somewhat begrudgingly partake in an hour of sea shanties.")
    



}
