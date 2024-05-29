/// @description Level Up
//@param show_gui 
//@param needs_rum

function PirateLevelUp(argument0, argument1) {

	melleActions = ds_list_create()
	rangedActions = ds_list_create()
	cannonActions = ds_list_create()
	shipActions = ds_list_create()

	ds_list_add(melleActions, HoldFastAction, HammerBlowAction, FinishingStabAction, ScoutingAction, HeavyBoardingAction, SwarmAction)  
	ds_list_add(rangedActions, BleedingShotAction, TargetedFireAction, CauseChaosAction, LookoutAction, BarrageAction, SniperAction) 
	ds_list_add(cannonActions, ConcentratedFireAction, ShrapnelAction, ChainShotAction, WarningShotAction, CannonSprayAction, BroadsideAction) 
	ds_list_add(shipActions, SurgeryAction, DisengageAction, EngageAction, SurpriseAction, OutmaneuverAction, RammingAction) 

	for(i=0; i<2; i++)
	    {
	    tempActions[i] = myAction[0]
	    choosingAction = true
	    while choosingAction
	        {
	        //get random action
	        myActionList = choose(melleActions, rangedActions, cannonActions, shipActions)
	        myNewAction = ds_list_find_value(myActionList, irandom(ds_list_size(myActionList)-1))
        
	        //create action as refferance
	        if !instance_exists(myNewAction)
	                with instance_create(-1000,-200, myNewAction)
	                    {
	                    pirateDrawTest = true
	                    event_user(2)
	                    }
        
	        //test action requirements     
	        if myNewAction != myAction[0] and myNewAction != myAction[1] and myNewAction != tempActions[0]
	            {
	            if object_index == Pirate
	                {
	                for(r=0; r<array_length_1d(myNewAction.requiredSlot); r++)
	                    if (myNewAction.requiredSlot[r] == "none") or (mySlot.slotType == myNewAction.requiredSlot[r]) or mySlot.slotType == "bed"
	                        choosingAction = false
	                }
	            else
	                choosingAction = false
	            }
	        tempActions[i] = myNewAction
	        }
	    }
    
	//level up using actions
	if (object_index == Pirate and (HasStored(5,1)) and mySlot.slotType != "bed") or !argument1
	    {
	    morale = 0
	    maxHealth += power(2,global.seaLevel) * 20
	    myHealth += power(2,global.seaLevel) * 20
    
	    //In-game Pirate Level-up
	    if argument0 == true
	        {
	        with instance_create(-1000, room_height/2, PirateLeveler)
	            {
	            action[0] = other.tempActions[0]
	            action[1] = other.tempActions[1]
	            myPirate = other.id
	            GameStatsController.totalCrewStars ++
	            }            
	        LoseCargo(5,1)
	        }
	    //other level-ups
	    else
	        {
	        captianActionList[0] = melleActions
	        captianActionList[1] = rangedActions
	        captianActionList[2] = cannonActions
	        if object_index == ChooseCaptain {
	            findAction = irandom(ds_list_size(shipActions)-1)
	            myTempAction = ds_list_find_value(shipActions, findAction)
				while instance_exists(myTempAction){
					findAction = irandom(ds_list_size(shipActions)-1)
					myTempAction = ds_list_find_value(shipActions, findAction)
				}
	        }
	        else if object_index == ChooseFirstMate
	            {
	            myActionNumber = irandom(ds_list_size(global.attackTypeList) - 2)
	            myTempActionList = captianActionList[ds_list_find_value(global.attackTypeList, myActionNumber)]
	            myTempAction = ds_list_find_value(myTempActionList, irandom(ds_list_size(myTempActionList)-1))
	            ds_list_delete(global.attackTypeList, myActionNumber)
	            }
	        else
	            {
	            myTempActionList = captianActionList[irandom(3)]
	            myTempAction = ds_list_find_value(myTempActionList, irandom(ds_list_size(myTempActionList)-1))
	            }

	        PirateLevelUpFinal(id, myTempAction)
	        }
	    } 
	else if !HasStored(5,1)
	    {
	    if argument0 == true and object_index = Pirate
	        {
			showMessage = true
			with Pirate	
				if leveling == true
					other.showMessage = false

			if morale > 7{
				if leveling == false and showMessage
					ds_list_add(global.notificationList, "Pirates failed to level up!", "There is no grog to drink! Get grog to increase the skill of your crew.")
				leveling = true
				morale = Pirate.moraleMax[stars] + 1
			}
		}
	}     
	else if mySlot.slotType == "bed"
	    {
	    if argument0 == true and object_index = Pirate
	        {
			showMessage = true
			with Pirate	
				if leveling == true
					other.showMessage = false
				
		    if morale > 7 and mySlot.slotType == "bed"{
				if leveling == false and showMessage
					ds_list_add(global.notificationList, "Pirates failed to level up!", "some pirates were in bed and could not level up!")
				leveling = true
				morale = Pirate.moraleMax[stars] + 1
				}
			}  
	    }




}
