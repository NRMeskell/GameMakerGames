function SilverwheelCombat() {
	instance_create(0,0,SilverwheelEnemy)

	instance_destroy(EventDrawer)
	with CaptainSilverwheel    
	    instance_destroy()
    
	script_execute(closeEventCode)



}
