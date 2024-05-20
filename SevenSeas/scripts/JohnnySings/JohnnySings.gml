function JohnnySings() {
	ds_list_add(global.notificationList, "Johnny Shortsticks sings!", "Johnny shortsticks leads some sea shanties for the crew!")
	global.moraleBoost = "Johnny"
	with Pirate
	    {
	    UpdateMorale(choose(-1,1),-1)
	    UpdateMorale(1,global.JOLLY)
	    UpdateMorale(-1,global.FEARSOME)
	    }
    
	JohnnyShortsticks.myState = 1



}
