/// @description Run Away
function AmbushedRun() {
	
	UpdateMorale(-1, global.FEARSOME)

	if argument0
	    {
	    ds_list_add(global.notificationList, "Enemy Avoided", "the ambushed was spotted and successfully avoided!")
	    script_execute(closeEventCode, 2)
	    }
	else
	    {	
		if searchReputationType("patrol")[0] < 3 or irandom(1){
			
		    ds_list_add(global.notificationList, "The enemy was too fast!", "They got off a round while we be running!")
		    myEnemyList = ds_map_find_value(EventController.enemyMap, global.seaType)
		    myEnemy = ds_list_find_value(myEnemyList, irandom(ds_list_size(myEnemyList)-1))
    
		    with instance_create(0, 0, myEnemy){
		        pirateMoved = true
		        playerTurn = false
		        event_user(0)
		    }
		}
		else{
			ds_list_add(global.notificationList, "Cove Patrol!", "Captain Hardcoin, having recorded your " + searchReputationType("patrol")[1] + ", chases away the ambushers for you!")
		}
	script_execute(closeEventCode, 2)
	}
}
