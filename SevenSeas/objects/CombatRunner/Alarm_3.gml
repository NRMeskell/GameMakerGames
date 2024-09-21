/// @description Add Enemy Attack

chosenAttack = noone
if irandom(power(ds_list_size(possibleEnemyActions),2)) > 0{

	chosenAttack = ds_list_find_value(possibleEnemyActions, max(0,round(choose(0, 0, 0, 0.3, 0.3, 0.6, 1)*(ds_list_size(possibleEnemyActions)-1))))
     
	if !is_undefined(chosenAttack){
		with chosenAttack{
		    waitLeft = rechargeTime
		}
       
		with instance_create(0,0,chosenAttack.myAttack){
		    priority = irandom_range(other.chosenAttack.priorityMin, other.chosenAttack.priorityMax)
		    crewTarget = Pirate
		    shipTarget = Ship
		    myCrewTarget = Enemy
		    myShipTarget = CombatRunner
		    targetPirate = instance_find(Pirate, irandom(instance_number(Pirate)-1))
		    myPirate = other.chosenAttack.myPirate
        
		    event_user(3)
	    }  
	}
	else{
		chosenAttack = noone
	}
}

