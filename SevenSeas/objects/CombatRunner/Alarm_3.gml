/// @description Add Enemy Attack

var pirateAttack = noone
if instance_exists(RealAttack)
	pirateAttack = instance_find(RealAttack, 0)

allowShipActions = true
allowMeleeActions = true
allowRangedActions = true
allowCannonActions = true

Ship.allowShipActions = true
Ship.allowMeleeActions = true
Ship.allowRangedActions = true
Ship.allowCannonActions = true

chosenAttack = noone
if irandom(power(ds_list_size(possibleEnemyActions)*2,2)) > 0{
	
	// choose enemy action
	var attackNum = random_range(0.01, 0.99)
	var currVal = 0
	var attackIter = -1
	while currVal < attackNum{
		attackIter += 1
		currVal += ds_list_find_value(possibleEnemyActions, attackIter)[1]
	}
	
	chosenAttack = ds_list_find_value(possibleEnemyActions, attackIter)[0]
	
	
	// attack was chosen
	if !is_undefined(chosenAttack){
		with chosenAttack{
		    waitLeft = rechargeTime
		}
       
		with instance_create(0,0,chosenAttack.myAttack){
			// Priority value set at end of event 1
		    priority =  ds_list_find_value(CombatRunner.possibleEnemyActions, attackIter)[2]
		    crewTarget = Pirate
		    shipTarget = Ship
		    myCrewTarget = Enemy
		    myShipTarget = CombatRunner
			// choose random pirate as target
			if global.enemyDiff < 2 or irandom(1)
				targetPirate = RandomPirate()
			// choose weakest pirate as target
			else{
				var lowHealth = 1.0;
				for(var i=0; i<instance_number(Pirate); i++){
					var tryTarget = instance_find(Pirate, i)
					if tryTarget.myHealth/tryTarget.maxHealth <= lowHealth{
						lowHealth = tryTarget.myHealth/tryTarget.maxHealth;
						targetPirate = tryTarget;
					}
				}
			}
		    myPirate = other.chosenAttack.myPirate
			myButton = other.chosenAttack.id
		    event_user(3)
	    }  
	}
	else{
		chosenAttack = noone
	}
}

