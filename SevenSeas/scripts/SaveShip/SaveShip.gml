function SaveShip(argument0) {
	ini_open(argument0 + "-ship.ini")

	ini_write_string("vars", "type", Ship.shipType)
	ini_write_string("vars", "maxHealth", Ship.maxHealth)
	ini_write_string("vars", "health", Ship.myHealth)

	for(i=0; i<10; i++){
	    ini_write_string("cargo" + string(i), "amount", CargoAmount(i))
	    }
	ini_write_string("food", "quality", global.foodQuality)
	ini_write_real("game", "sunPos", global.timeCycle)
	
	ini_close()
}
