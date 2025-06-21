/// @description Check Available

if (!instance_exists(myPirate)){
	canUse = false
	requireText = "crew member killed"
}
else{
	var attackPwr, myShipTarget;
	attackPwr = GetAttackPower(actionType, myPirate.object_index == Pirate or myPirate.object_index == Ship)
    if (myPirate.object_index == Pirate) or (myPirate.object_index == Ship)
		myShipTarget = Ship
	else
		myShipTarget = CombatRunner
	  
	warning = false
	canUse = true
	requireText = ""
	
	if waitLeft > 0 and !instance_exists(RealAttack) {
	    canUse = false
		requireText = "cool down timer"
	}
	else if (CombatRunner.piratesMoved == true){
	    canUse = false
		requireText = "crew moved this round"
	}
	else if (actionType == "ship" and !myShipTarget.allowShipActions) or (actionType == "cannon" and !myShipTarget.allowCannonActions) or (actionType == "ranged" and !myShipTarget.allowRangedActions) or (actionType == "melee" and !myShipTarget.allowMeleeActions) {
		if !instance_exists(RealAttack){
			canUse = false
			requireText = "attack type disabled"
		}
	}
	else if (actionType == "cannon" and myShipTarget.object_index == Ship and !HasStored(2,1)){
		canUse = false
		requireText = "out of cannonballs"
	}
	else if ((requiredSlot[0] != "none") and myPirate.object_index == Pirate and ((myPirate.mySlot.slotType != requiredSlot[0]) and (array_length(requiredSlot) == 1 or myPirate.mySlot.slotType != requiredSlot[1]))){
	    canUse = false
		requireText = "crew in incorrect slot"
	}
	else if (myPirate.object_index == Pirate and myPirate.stunned){
		canUse = true
		requireText = "crew cannot contribute"
	}
	else if (attackPwr = 0) {
		warning = true
		requireText = "missing required stats"
	}
	else if (((zoneRequired == 0 or actionType == "melee") and CombatRunner.closeRange = false) or ((zoneRequired == 1 or actionType == "cannon") and CombatRunner.closeRange = true)){
		warning = true
		requireText = "incorrect combat zone"
	}
}