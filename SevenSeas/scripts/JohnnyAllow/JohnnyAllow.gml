function JohnnyAllow() {
	if searchReputationType("repute")[0] < 3
		ds_list_add(global.notificationList, "Johnny be excited!", "he runs aboard the ship and below decks.")
	else{
		ds_list_add(global.notificationList, "Johnny be timid!", "he walks aboard the ship and below decks.")
	}
	with Pirate
	    {
	    UpdateMorale(-1, global.FEARSOME)
	    UpdateMorale(1, global.JOLLY)
	    } 
    
	JohnnyShortsticks.myState = "on ship"

	script_execute(closeEventCode)



}
