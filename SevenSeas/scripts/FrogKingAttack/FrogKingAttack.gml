function FrogKingAttack() {
	with instance_create(0, 0, TropicalEnemyRoyal){
	        pirateMoved = true
	        playerTurn = false
	        event_user(0)
	        }
        
	ds_list_add(global.notificationList, "Military Ambush!", "A Military Frog Ship seemingly appears and attacks the ship!")



}
