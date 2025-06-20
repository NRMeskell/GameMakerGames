/// @description Update Available Player Actions

ds_list_clear(actionList)
ds_list_add(actionList, basicShipRun, basicShipChange)
ds_list_add(actionList, basicMeleeAttack)
ds_list_add(actionList, basicRangedAttack)
ds_list_add(actionList, basicCannonAttack)
	
for(var i=0; i<instance_number(ActionParent); i++)
    {
    checkAction = instance_find(ActionParent,i)
	// ensure is a pirate power
    if instance_exists(checkAction.myPirate){ 
        if checkAction.myPirate.object_index == Pirate and checkAction.pirateDrawTest == false and checkAction.object_index != LostEyeAction
            {
            ds_list_add(actionList, checkAction)
            }
		}
	}


/* */
///Update Available Enemy Actions

ds_list_clear(enemyActionList)
ds_list_clear(desireList)
ds_list_clear(priorityList)

for(i=0; i<instance_number(ActionParent); i++)
    {
    checkAction = instance_find(ActionParent,i)
    
    if instance_exists(checkAction.myPirate) and checkAction.pirateDrawTest == false
        if (checkAction.myPirate.object_index == CombatRunner or ((checkAction.myPirate.object_index != Pirate and checkAction.myPirate.object_index != Ship) and checkAction.myPirate.stunned == false))
            {
            //Check action requirements
            if checkAction.waitLeft = 0 and ((checkAction.zoneRequired == -1) or (checkAction.zoneRequired == 0 and closeRange = true) or (checkAction.zoneRequired == 1 and closeRange = false))
                if /*not disabled*/ ((checkAction.actionType == "melee" and allowMeleeActions) or (checkAction.actionType == "ranged" and allowRangedActions) or (checkAction.actionType == "cannon" and allowCannonActions) or (checkAction.actionType == "ship" and allowShipActions))
					ds_list_add(enemyActionList, checkAction)
            }
    }
	
	
// UPDATE STATS BEFORE CHOOSING DESIRABILITYS
myStats[0] = 0
myStats[1] = 0
myStats[2] = 0
myStats[3] = 0

with Enemy
    if stunned = false
	    {
	    for(i=0; i<ds_list_size(myStats); i++)
	        {
	        if ds_list_find_value(myStats, i) < 5
	            other.myStats[ds_list_find_value(myStats, i)] += 1
	        else
	            other.myStats[3] += 1
	        }
	    } 
	

/* */
///Choose Enemy Attacks

if myHealth > 0 and instance_number(Enemy) > 0
    {       
    ///find preferable distance
    closePreferance = myStats[0]*2 - (global.totalSwordBonus div 2) - myStats[2] + (global.totalCannonBonus div 2)
    farPreferance = myStats[2]*2 - (global.totalCannonBonus div 2) - myStats[0] + (global.totalSwordBonus div 2)
    wantsClose = max(sign(closePreferance - farPreferance), 0)
    
    melleDamage = UpdateDamage(myStats[0], false)
    rangedDamage = UpdateDamage(myStats[1], false)
    cannonDamage = UpdateDamage(myStats[2], false)
    
    //Take Turn
    for(var i=0; i<ds_list_size(enemyActionList); i++){
        currentAction = ds_list_find_value(enemyActionList, i)
		
		
		// ## Add priority of each action to list ##
		ds_list_add(priorityList, irandom_range(currentAction.priorityMin, currentAction.priorityMax))
        
		// ## Add desire of each action to list ##
        if currentAction.actionType = "melee"{  //add melee attack 
            if closeRange
                ds_list_add(desireList, UpdateDamage(melleDamage*(currentAction.priorityMax+(currentAction.rechargeTime)+DamageController.damageScaler[? currentAction.myAttack]), false))
            else
                ds_list_add(desireList, 0)
            }
        else if currentAction.actionType = "ranged"{ //add ranged attack
            ds_list_add(desireList, UpdateDamage(rangedDamage*(currentAction.priorityMax+(currentAction.rechargeTime)+DamageController.damageScaler[? currentAction.myAttack]), false))
            }
        else if currentAction.actionType = "cannon"{  //add melee attack 
            if !closeRange
                ds_list_add(desireList, UpdateDamage(cannonDamage*(currentAction.priorityMax+(1+currentAction.rechargeTime)+DamageController.damageScaler[? currentAction.myAttack]), false))
            else
                ds_list_add(desireList, 0)
            }
        else{                               //add ship attack 
            if currentAction.changeZones and closeRange != wantsClose and myStats[3] > 0
                ds_list_add(desireList, currentAction.priorityMax+(currentAction.rechargeTime)*abs(cannonDamage-melleDamage)*5)
            else if !currentAction.changeZones and myStats[3] > 0
				ds_list_add(desireList, currentAction.priorityMax+(currentAction.rechargeTime)*8)
			else
                ds_list_add(desireList, 0)
            }
        
			// Simple AI mixes up desire
			if global.enemyDiff == 0{
				ds_list_replace(desireList, ds_list_size(desireList)-1, ds_list_find_value(desireList, ds_list_size(desireList)-1)*random_range(0.85, 1.2))
			}
			// Detailed modifiers for complex AI
			if global.enemyDiff == 2{ 
				// Ability has high priority 
				var priPercent = ds_list_find_value(priorityList, ds_list_size(desireList)-1)/currentAction.priorityMax
				var priMod = power(priPercent, 1/3)
				ds_list_replace(desireList, ds_list_size(desireList)-1, priMod*ds_list_find_value(desireList, ds_list_size(desireList)-1))
				
				// Ability can target weak enemies
				if	currentAction.needsTarget{
					ds_list_replace(desireList, ds_list_size(desireList)-1, 1.2*ds_list_find_value(desireList, ds_list_size(desireList)-1))
				}
				// Crew giving ability is low on health
				if currentAction.myPirate.object_index == Enemy and currentAction.myPirate.myHealth/currentAction.myPirate.maxHealth < 0.15{
					var lowHealthMod = arctan(ds_list_find_value(priorityList, ds_list_size(desireList)-1)/5)
					ds_list_replace(desireList, ds_list_size(desireList)-1, lowHealthMod*ds_list_find_value(desireList, ds_list_size(desireList)-1))
				}
			}
		}
    }

 
//Chose Actions by desirability (Top 4 Chosen)
ds_list_clear(possibleEnemyActions)
var totalDesire = 0
for(var i=0; i<4; i++){
    var myAction = -1
    var maxDesire = 0
    for(var r=0; r<ds_list_size(desireList); r++){
        if ds_list_find_value(desireList, r) > maxDesire{
            myAction = r
            maxDesire = ds_list_find_value(desireList, r)
        }
    }
 
    if myAction > -1{
		totalDesire += power(maxDesire, 2)
        ds_list_add(possibleEnemyActions, [ds_list_find_value(enemyActionList, myAction), power(maxDesire,2), ds_list_find_value(priorityList, myAction)])
        ds_list_delete(enemyActionList, myAction)
        ds_list_delete(desireList, myAction)
    }
}

for(var i=0; i<ds_list_size(possibleEnemyActions); i++){
	ds_list_replace(possibleEnemyActions, i, [ds_list_find_value(possibleEnemyActions, i)[0], ds_list_find_value(possibleEnemyActions, i)[1]/totalDesire, ds_list_find_value(possibleEnemyActions, i)[2]])
}
