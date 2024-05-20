function JohnnyDeny() {
	ds_list_add(global.notificationList, "Johnny be dissapointed!", "he hangs his head and walks away.")

	with Pirate
	    {
	    UpdateMorale(1, global.JOLLY)
	    UpdateMorale(-1, global.FEARSOME)
	    }  

	if irandom(1) == 0
	    JohnnyShortsticks.myState = "on ship"
	else if irandom(1) == 0
	    JohnnyShortsticks.myState = "revenge"

	if irandom(2) == 0
	    instance_destroy(JohnnyShortsticks)

	script_execute(closeEventCode)






}
