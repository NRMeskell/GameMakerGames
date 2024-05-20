function AmbushedChase() {
	//Ambushed!

	if argument0{
		ds_list_add(global.notificationList, "Caught!", "The enemy cannot outrun our ship, and combat initiates!")
		myEnemyList = ds_map_find_value(EventController.enemyMap, global.seaType)
		myEnemy = ds_list_find_value(myEnemyList, irandom(ds_list_size(myEnemyList)-1))

		instance_create(0, 0, myEnemy)
		
		UpdateMorale(1, global.FEARSOME)
	}
	else{
		ds_list_add(global.notificationList, "Escaped!", "The enemy was too fast, and avoided our pursuit")
		UpdateMorale(-1, global.FEARSOME)
	}
	script_execute(closeEventCode, 2)
}
