/// @description Update Available Actions

ds_list_clear(actionList)
ds_list_add(actionList, basicMelleAttack, basicRangedAttack, basicCannonAttack, basicShipRun, basicShipChange)

for(i=0; i<instance_number(ActionParent); i++)
    {
    checkAction = instance_find(ActionParent,i)
    if checkAction.myPirate != noone and checkAction.pirateDrawTest == false and checkAction.object_index != LostEyeAction
        if checkAction.myPirate.injured < 1 and checkAction.myPirate.stunned = false
            {
            //Check action requirements
            available = false
            for(r=0; r<array_length_1d(checkAction.requiredSlot); r++)
               if /*right slot*/((checkAction.requiredSlot[r] == "none") or (checkAction.myPirate.mySlot.slotType == checkAction.requiredSlot[r])) and /*right combat zone*/ ((checkAction.zoneRequired == -1) or (checkAction.zoneRequired == 0 and closeRange = true) or (checkAction.zoneRequired == 1 and closeRange = false))// or (ds_list_find_index(global.crewList, checkAction.myPirate) == 0)
                    available = true
            
            if available
                ds_list_add(actionList, checkAction)
            }
    }

/* */
/*  */
