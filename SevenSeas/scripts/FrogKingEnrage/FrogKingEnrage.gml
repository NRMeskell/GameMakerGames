function FrogKingEnrage() {	
	ds_list_add(global.notificationList, "War Horn Blown!", "The frog king blows a horn and returns to his fortress! A large tropical war ship emerges and attacks")

	instance_create(0, 0, TropicalEnemyRoyal)

	FrogKing.myState = "war"
	with EventDrawer
	    floatAway = true

	script_execute(closeEventCode)



}
