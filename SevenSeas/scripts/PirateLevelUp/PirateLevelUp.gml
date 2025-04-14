/// @description PirateLevelUp(show_gui, needs_rum)
//@param show_gui 
//@param needs_rum

function PirateLevelUp(argument0, argument1) {
	leveler = undefined;
	var slotType;
	if object_index == Pirate	
		slotType = mySlot.slotType 
	else{
		if statTotal[5] > 0 
			slotType = "wheel"
		else if statTotal[6] > 0
			slotType = "medical"
		else if statTotal[2] > 0
			slotType = "cannon"
		else
			slotType = "rigging"
	}
	
	var meleeActions = ds_list_create()
	var rangedActions = ds_list_create()
	var cannonActions = ds_list_create()
	var shipActions = ds_list_create()

	ds_list_add(meleeActions, HoldFastAction, HammerBlowAction, FinishingStabAction, ScoutingAction, HeavyBoardingAction, SwarmAction)  
	ds_list_add(rangedActions, BleedingShotAction, TargetedFireAction, CauseChaosAction, LookoutAction, BarrageAction, SniperAction) 
	ds_list_add(cannonActions, ConcentratedFireAction, ShrapnelAction, ChainShotAction, WarningShotAction, CannonSprayAction, BroadsideAction) 
	ds_list_add(shipActions, SurgeryAction, DisengageAction, EngageAction, SurpriseAction, OutmaneuverAction, RammingAction) 

	var tempActions, choosingAction, myActionList, myNewAction;
	
	for(i=0; i<2; i++)
	    {
	    tempActions[i] = myAction[0]
	    choosingAction = true
		var breakam = 0;
	    while choosingAction
	        {
			breakam += 1
			if breakam > 100
				break;
	        //get random action
	        myActionList = choose(meleeActions, rangedActions, cannonActions, shipActions)
	        myNewAction = ds_list_find_value(myActionList, irandom(ds_list_size(myActionList)-1))
        
	        //create action as refferance
	        if !instance_exists(myNewAction)
	            with instance_create(-1000,-200, myNewAction)
	                {
	                pirateDrawTest = true
	                event_user(2)
	                }
        
	        //test action requirements     
	        if myNewAction != myAction[0] and myNewAction != myAction[1] and myNewAction != myAction[2] and myNewAction != tempActions[0]
	            {
	            for(var r=0; r<array_length_1d(myNewAction.requiredSlot); r++)
	                if (myNewAction.requiredSlot[r] == "none") or (slotType == myNewAction.requiredSlot[r])
	                    choosingAction = false
	            }
	        }
			tempActions[i] = myNewAction
	    }
    
	//level up using actions
	if (object_index == Pirate and (HasStored(5,1))) or !argument1{
	    morale = 0
		prevMorale = morale
	    maxHealth += 20
	    myHealth += 20
		healthDiff = myHealth
    
	    //In-game Pirate Level-up
	    if argument0 == true{
	        leveler = instance_create(-1000, room_height/2, PirateLeveler)
		    leveler.action[0] = tempActions[0]
		    leveler.action[1] = tempActions[1]
		    leveler.myPirate = id
		    GameStatsController.totalCrewStars ++            
	        LoseCargo(5,1)
	    }
	    //other level-ups
	    else{
	        PirateLevelUpFinal(id, tempActions[0], -1)
	    }
	} 
	else if !HasStored(5,1){
	    if argument0 == true and object_index = Pirate{
			showMessage = true
			with Pirate	
				if leveling == true
					other.showMessage = false

			if showMessage
				ds_list_add(global.notificationList, "Pirates failed to level up!", "There is no grog to drink! Get grog to increase the skill of your crew.")
			leveling = true
			morale = Pirate.moraleMax[stars] + 1
		}
	} 
	return leveler
}
