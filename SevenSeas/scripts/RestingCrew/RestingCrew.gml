/// @description Rested Crew
function RestingCrew() {
	global.moraleBoost = "rested"
	with Pirate
	    {
		UpdateMorale(1, -1)
		if other.campPower == 3{
		    myHealth = round(min(myHealth + (maxHealth*1/(1+global.gameDiff)), maxHealth))
			}
		if other.campPower == 2{
		    myHealth = round(min(myHealth + (maxHealth*1/(2+global.gameDiff)), maxHealth))
			}
		else{
			myHealth = round(min(myHealth + (maxHealth*1/(4+global.gameDiff)), maxHealth))
			}
	    }
    
	boards = 0
	while HasStored(3,1) and (Ship.myHealth != Ship.maxHealth) and boards < (campPower+1)
	    {
	    Ship.myHealth = min(Ship.myHealth + (Ship.maxHealth div 10), Ship.maxHealth)
	    boards += 1
	    LoseCargo(3,1)
	    }
	
	ds_list_add(global.notificationList, "crew rested!", "the crew recovered health and morale!" + string_repeat("##" + string(boards) + " board(s) were used to repair the ship.", sign(boards)))
}
