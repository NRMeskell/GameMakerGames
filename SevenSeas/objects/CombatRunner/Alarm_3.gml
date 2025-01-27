/// @description Add Enemy Attack

allowShipActions = true
allowMelleActions = true
allowRangedActions = true
allowCannonActions = true

Ship.allowShipActions = true
Ship.allowMelleActions = true
Ship.allowRangedActions = true
Ship.allowCannonActions = true

chosenAttack = noone
if irandom(power(ds_list_size(possibleEnemyActions)*2,2)) > 0{
	
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
		    targetPirate = RandomPirate()
		    myPirate = other.chosenAttack.myPirate
        
		    event_user(3)
	    }  
	}
	else{
		chosenAttack = noone
	}
}

