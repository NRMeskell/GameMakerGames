function SilverwheelCombat() {
	instance_create(0,0,SilverwheelEnemy)

	instance_destroy(EventDrawer)
	with CaptainSilverwheel    
	    instance_destroy()
		
	ds_list_add(global.notificationList, "Silverwheel attacks", "Insulted by your dismissal, the captain opens fire!")
    
	script_execute(closeEventCode)
}
