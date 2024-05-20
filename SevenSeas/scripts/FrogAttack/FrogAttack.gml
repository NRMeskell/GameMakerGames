function FrogAttack() {
	//engage

	instance_create(0,0,myShip.myShipType)
	instance_destroy(EventDrawer)

	ds_list_add(global.notificationList, "They be upon us!", "Man yer stations!")
    
	script_execute(closeEventCode, 2)
}
