/// @description Wait for enemy turn if stuff is open

if instance_exists(Event) or ds_list_size(global.notificationList) > 0{
    alarm[2] = 20
    exit
}

///Enemy Effect lower and bleeding
    
with Pirate
    if bleeding
        myHealth = (myHealth*0.75) div 1
        
with EffectParent
    {
    if team = "pirate"
        {
        duration -= 1
        if duration < 0
            instance_destroy()
        }
    }
    
with Pirate
    {
    if irandom(1)
        {
        stunned = false
        exposed = false
        bleeding = false
        }
    }

///Use Enemy Attacks

if myHealth > 0 and instance_number(Enemy) > 0
    {
    event_user(6) //update enemy stats
    
    if closeRange
        currentDistance = 100
    else
        currentDistance = 0
        
    ///find preferable distance
    closePreferance = (myStats[0] + (1+ds_list_size(specialMelleActions))) - (global.totalSwordBonus div 2) - myStats[2] + (global.totalCannonBonus div 2)
    farPreferance = (myStats[2] * (1+ds_list_size(specialRangedActions))) - (global.totalCannonBonus div 2) - myStats[0] + (global.totalSwordBonus div 2)
    wantsClose = max(sign(closePreferance - farPreferance), 0)
    
    melleDamage = UpdateEnemyDamage(myStats[0], "melle")
    rangedDamage = UpdateEnemyDamage(myStats[1], "ranged")
    cannonDamage = UpdateEnemyDamage(myStats[2], "cannon")
    
    //Take Turn
    if closeRange
        {
        if ((!wantsClose and (random(1) > (1/(1+(myStats[3]/2))))) or (ds_list_size(basicMelleActions) == 0 and ds_list_size(basicRangedActions) == 0)) and ds_list_size(basicShipActions) > 0
            {
            //change slots
            if irandom(2 + ds_list_size(specialShipActions)) < 3
                chosenEnemyAttack = ds_list_find_value(basicShipActions, irandom(ds_list_size(basicShipActions)-1))
            else
                chosenEnemyAttack = ds_list_find_value(specialShipActions, irandom(ds_list_size(specialShipActions)-1))
            }
        else
            {
            useGunChance = 0
            useSwordChance = 0
            if rangedDamage > melleDamage
                useGunChance = (1 - melleDamage/rangedDamage) * (ds_list_size(specialRangedActions)*0.1 + 1)
            if melleDamage > rangedDamage
                useSwordChance = (1 - rangedDamage/melleDamage) * (ds_list_size(specialMelleActions)*0.1 + 1)
             
            if ((random_range(-1.5, 1.5) < useSwordChance - useGunChance) or (ds_list_size(basicRangedActions) == 0)) and ds_list_size(basicMelleActions) > 0
                {
                //use swords
                if irandom(2 + ds_list_size(specialMelleActions)) < 3
                    chosenEnemyAttack = ds_list_find_value(basicMelleActions, irandom(ds_list_size(basicMelleActions)-1))
                else
                    chosenEnemyAttack = ds_list_find_value(specialMelleActions, irandom(ds_list_size(specialMelleActions)-1))
                }
            else
                {
                if irandom(2 + ds_list_size(specialRangedActions)) < 3
                    chosenEnemyAttack = ds_list_find_value(basicRangedActions, irandom(ds_list_size(basicRangedActions)-1))
                else
                    chosenEnemyAttack = ds_list_find_value(specialRangedActions, irandom(ds_list_size(specialRangedActions)-1))
                }
            }
        }
    else
        {
        //change slots
        if ((wantsClose and (random(1) > (1/(1+(myStats[3]/2))))) or (ds_list_size(basicCannonActions) == 0 and ds_list_size(basicRangedActions) == 0)) and ds_list_size(basicShipActions) > 0
            {
            if irandom(2 + ds_list_size(specialShipActions)) < 3
                chosenEnemyAttack = ds_list_find_value(basicShipActions, irandom(ds_list_size(basicShipActions)-1))
            else
                chosenEnemyAttack = ds_list_find_value(specialShipActions, irandom(ds_list_size(specialShipActions)-1))
            }
        else
            {
            useGunChance = 0
            useCannonChance = 0
            if rangedDamage > cannonDamage
                useGunChance = (1 - cannonDamage/rangedDamage) * (ds_list_size(specialRangedActions)*0.1 + 1)
            if cannonDamage > rangedDamage
                useCannonChance = (1 - rangedDamage/cannonDamage) * (ds_list_size(specialCannonActions)*0.1 + 1)
                
            //Fire cannon
            if (random_range(-1.5,1.5) < (useCannonChance - useGunChance) or (ds_list_size(basicRangedActions) == 0)) and ds_list_size(basicCannonActions) > 0
                {
                if irandom(2 + ds_list_size(specialCannonActions)) < 3
                    chosenEnemyAttack = ds_list_find_value(basicCannonActions, irandom(ds_list_size(basicCannonActions)-1))
                else
                    chosenEnemyAttack = ds_list_find_value(specialCannonActions, irandom(ds_list_size(specialCannonActions)-1))
                }
            else
            //fire guns
                {
                if irandom(2 + ds_list_size(specialRangedActions)) < 3
                    chosenEnemyAttack = ds_list_find_value(basicRangedActions, irandom(ds_list_size(basicRangedActions)-1))
                else
                    chosenEnemyAttack = ds_list_find_value(specialRangedActions, irandom(ds_list_size(specialRangedActions)-1))
                }
            }
        }
        
    with instance_create(0,0,chosenEnemyAttack)
        {
        crewTarget = Pirate
        shipTarget = Ship
        myCrewTarget = Enemy
        myShipTarget = CombatRunner
        targetPirate = instance_find(Pirate, irandom(instance_number(Pirate)-1))
        
        if ds_list_find_index(other.basicMelleActions, object_index) != -1 or ds_list_find_index(other.specialMelleActions, object_index) != -1 
            attackPower = other.myStats[0]
        else if ds_list_find_index(other.basicRangedActions, object_index) != -1 or ds_list_find_index(other.specialRangedActions, object_index) != -1 
            attackPower = other.myStats[1]
        else if ds_list_find_index(other.basicCannonActions, object_index) != -1 or ds_list_find_index(other.specialCannonActions, object_index) != -1 
            attackPower = other.myStats[2]
        else
            attackPower = other.myStats[3]
            
        event_user(3)
        }  
    }

