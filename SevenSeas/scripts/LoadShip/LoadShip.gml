function LoadShip(argument0) {
	ini_open(argument0 + "-ship.ini")

	SwitchShips(real(ini_read_string("vars", "type", 0)))
	Ship.maxHealth = real(ini_read_string("vars", "maxHealth", Ship.maxHealth))
	Ship.myHealth = real(ini_read_string("vars", "health", Ship.myHealth))
	Ship.healthDiff = Ship.myHealth

	with Cargo
	    event_user(2)

	for(r=0; r<10; r++){
	    defaultAmout = (r==0)*50 + (r==2)*10 + (r==6)*12
	    amount = real(ini_read_string("cargo" + string(r), "amount", defaultAmout))
	    StoreItem(r, amount)
	    }
    
	global.foodQuality = real(ini_read_string("food", "quality", 2))
	global.timeCycle = ini_read_real("game", "sunPos", global.timeCycleLength/16)
	
	with FoodTimer
		if ((sunriseMeal and global.timeCycle < global.timeCycleLength div 2) or (!sunriseMeal and global.timeCycle > global.timeCycleLength div 2))
			sunriseMeal = !sunriseMeal
	
	ini_close()



}
