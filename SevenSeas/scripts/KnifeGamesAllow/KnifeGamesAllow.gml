/// @description clean up the mess
function KnifeGamesAllow() {

	if irandom(1)
		with instance_create(0,0,ConditionTimer){
			condition = KnifeGameHurt
			KnifeGamePirate = other.myPirate
		}

	with otherPirate
		UpdateMorale(-1, -1)
		
	ds_list_add(global.notificationList, myPirate.firstName + " relieved!", "They continue to play their knife games, annoying " + otherPirate.firstName + ".")
}
