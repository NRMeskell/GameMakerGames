function NoiseAllow() {
	//Pay up

	with Pirate
	    {
	    UpdateMorale(-2,global.JOLLY)
	    UpdateMorale(choose(-1,0), global.DARING)
	    UpdateMorale(choose(0, 1), global.FEARSOME)
	    UpdateMorale(1,global.KEEN)
	    }
    
	ds_list_add(global.notificationList, "noise rules created!", "the cabin is much quieter. The rules are met with mixed reactions!")
     



}
