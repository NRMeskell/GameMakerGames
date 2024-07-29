/// @description Update Available Player Actions

ds_list_clear(actionList)
if Ship.allowShipActions
	ds_list_add(actionList, basicShipChange)
if Ship.allowMelleActions
	ds_list_add(actionList, basicMelleAttack)
if Ship.allowRangedActions
	ds_list_add(actionList, basicRangedAttack)
if Ship.allowCannonActions
	ds_list_add(actionList, basicCannonAttack)
	
for(var i=0; i<instance_number(ActionParent); i++)
    {
    checkAction = instance_find(ActionParent,i)
    if instance_exists(checkAction.myPirate) 
        if checkAction.myPirate.object_index == Pirate and checkAction.pirateDrawTest == false and checkAction.object_index != LostEyeAction
            if checkAction.myPirate.stunned = false
                {
                //Check action requirements
                available = false
                for(var r=0; r<array_length_1d(checkAction.requiredSlot); r++)
					if /*right slot*/((checkAction.requiredSlot[r] == "none") or (checkAction.myPirate.mySlot.slotType == checkAction.requiredSlot[r])) and /*right combat zone*/ ((checkAction.zoneRequired == -1) or (checkAction.zoneRequired == 0 and closeRange = true) or (checkAction.zoneRequired == 1 and closeRange = false)) 
						if /*not disabled*/ ((checkAction.myType == "melle" and Ship.allowMelleActions) or (checkAction.myType == "ranged" and Ship.allowRangedActions) or (checkAction.myType == "cannon" and Ship.allowCannonActions) or (checkAction.myType == "ship" and Ship.allowShipActions))
							available = true
                
                if available
                    ds_list_add(actionList, checkAction)
                }
    }


/* */
///Update Available Enemy Actions

ds_list_clear(enemyActionList)

for(i=0; i<instance_number(ActionParent); i++)
    {
    checkAction = instance_find(ActionParent,i)
    
    if instance_exists(checkAction.myPirate) and checkAction.pirateDrawTest == false
        if (checkAction.myPirate.object_index == CombatRunner or ((checkAction.myPirate.object_index != Pirate and checkAction.myPirate.object_index != Ship) and checkAction.myPirate.stunned == false))
            {
            //Check action requirements
            if checkAction.waitLeft = 0 and ((checkAction.zoneRequired == -1) or (checkAction.zoneRequired == 0 and closeRange = true) or (checkAction.zoneRequired == 1 and closeRange = false))
                if /*not disabled*/ ((checkAction.myType == "melle" and allowMelleActions) or (checkAction.myType == "ranged" and allowRangedActions) or (checkAction.myType == "cannon" and allowCannonActions) or (checkAction.myType == "ship" and allowShipActions))
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
    
    melleDamage = UpdateEnemyDamage(myStats[0], "melle")
    rangedDamage = UpdateEnemyDamage(myStats[1], "ranged")
    cannonDamage = UpdateEnemyDamage(myStats[2], "cannon")
    
    ds_list_clear(desireList)
    //Take Turn
    for(var i=0; i<ds_list_size(enemyActionList); i++){
        currentAction = ds_list_find_value(enemyActionList, i)
        
        if currentAction.myType = "melle"{  //add melle attack 
            if closeRange
                ds_list_add(desireList, UpdateEnemyDamage(melleDamage*(sqrt(currentAction.rechargeTime)+DamageController.damageScaler[? currentAction.myAttack]), "melle"))
            else
                ds_list_add(desireList, 0)
            }
        else if currentAction.myType = "ranged"{ //add ranged attack
            ds_list_add(desireList, UpdateEnemyDamage(rangedDamage*(sqrt(currentAction.rechargeTime)+DamageController.damageScaler[? currentAction.myAttack]), "ranged"))
            }
        else if currentAction.myType = "cannon"{  //add melle attack 
            if !closeRange
                ds_list_add(desireList, UpdateEnemyDamage(cannonDamage*(sqrt(1+currentAction.rechargeTime)+DamageController.damageScaler[? currentAction.myAttack]), "cannon"))
            else
                ds_list_add(desireList, 0)
            }
        else{                               //add ship attack 
            if closeRange != wantsClose and myStats[3] > 0
                ds_list_add(desireList, sqrt(currentAction.rechargeTime)*(cannonDamage + melleDamage + cannonDamage)*3)
            else
                ds_list_add(desireList, 0)
            }
        }
    }
 
//Chose Actions by desirability (Top 4 Chosen)
ds_list_clear(possibleEnemyActions)
for(var i=0; i<4; i++){
    myAction = -1
    maxDesire = 0
    for(var r=0; r<ds_list_size(desireList); r++){
        if ds_list_find_value(desireList, r) > maxDesire{
            myAction = r
            maxDesire = ds_list_find_value(desireList, r)
            }
        }
        
    if myAction > -1{
        ds_list_add(possibleEnemyActions, ds_list_find_value(enemyActionList, myAction))
        ds_list_delete(enemyActionList, myAction)
        ds_list_delete(desireList, myAction)
        }
    }

allowShipActions = true
allowMelleActions = true
allowRangedActions = true
allowCannonActions = true

Ship.allowShipActions = true
Ship.allowMelleActions = true
Ship.allowRangedActions = true
Ship.allowCannonActions = true
