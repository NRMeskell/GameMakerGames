function AmbushedFight() {
	//Ambushed!

	myEnemyList = ds_map_find_value(EventController.enemyMap, global.seaType)
	myEnemy = ds_list_find_value(myEnemyList, irandom(ds_list_size(myEnemyList)-1))

	instance_create(0, 0, myEnemy)
	script_execute(closeEventCode, 2)

}
