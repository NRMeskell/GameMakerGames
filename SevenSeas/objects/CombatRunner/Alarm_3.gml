/// @description Add Enemy Attack

chosenAttack = noone
if irandom(power(ds_list_size(possibleEnemyActions)+1,2)) > 0{
	
	var attackNum = random_range(0.01, 0.99)
	var currVal = 0
	var attackIter = -1
	while currVal < attackNum{
		attackIter += 1
		currVal += ds_list_find_value(possibleEnemyActions, attackIter)[1]
	}
	
	chosenAttack = ds_list_find_value(possibleEnemyActions, attackIter)[0]
     
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

