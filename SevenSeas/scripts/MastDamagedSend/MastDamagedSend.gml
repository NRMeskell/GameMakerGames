function MastDamagedSend() {
	//lose cargo

	result = irandom(10)        

	if argument0
	    {
	    ds_list_add(global.notificationList, "sails secured!", "the crew were able to safely save the ship") 
	    }
	else{
	    hurtPirate = RandomPirate()
	    ds_list_add(global.notificationList, "sails damaged!", hurtPirate.name + " was hurt while trying to securing the sails.") 
	    Ship.myHealth -= 50*(global.seaLevel+1)
	    hurtPirate.myHealth -= 25*(global.seaLevel+1)
	    }

	script_execute(closeEventCode, 2)






}
