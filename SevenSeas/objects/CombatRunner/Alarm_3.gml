/// @description Add Enemy Attack

chosenAttack = noone
if ds_list_size(possibleEnemyActions)+2 > irandom(ds_list_size(possibleEnemyActions)+2){

	chosenAttack = ds_list_find_value(possibleEnemyActions, round(choose(0, 0, 0, 0.3, 0.3, 0.6, 1)*(ds_list_size(possibleEnemyActions)-1)))
     
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

if chosenAttack == noone
	Enemy.stunned = false

