/// @description Check Available

if (!instance_exists(myPirate)){
	canUse = false
	requireText = "crew member killed"
}
else{
	var myShipTarget, swds, guns, cnns, whls;
	if myPirate.object_index == Pirate or myPirate.object_index == Ship{
		swds = global.totalSwordBonus
		whls = global.totalWheelBonus
		guns = global.totalGunBonus
		cnns = global.totalCannonBonus
		myShipTarget = Ship.id;
	}else{
		swds = CombatRunner.myStats[0]
		whls = CombatRunner.myStats[3]
		guns = CombatRunner.myStats[1]
		cnns = CombatRunner.myStats[2]
		myShipTarget = CombatRunner.id;
	}
      
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
	else if (myType == "ship" and !myShipTarget.allowShipActions) or (myType == "cannon" and !myShipTarget.allowCannonActions) or (myType == "ranged" and !myShipTarget.allowRangedActions) or (myType == "melee" and !myShipTarget.allowMeleeActions) {
		if !instance_exists(RealAttack){
			canUse = false
			requireText = "attack type disabled"
		}
	}
	else if (myType == "cannon" and myShipTarget.object_index == Ship and !HasStored(2,1)){
		canUse = false
		requireText = "out of cannonballs"
	}
	else if ((requiredSlot[0] != "none") and myPirate.object_index == Pirate and ((myPirate.mySlot.slotType != requiredSlot[0]) and (array_length(requiredSlot) == 1 or myPirate.mySlot.slotType != requiredSlot[1]))){
	    canUse = false
		requireText = "crew in incorrect slot"
	}
	else if (myType == "ship" and whls==0) or (myType == "cannon" and cnns==0) or (myType == "ranged" and guns==0) or (myType == "melee" and swds==0) {
		warning = true
		requireText = "missing required stats"
	}
	else if (((zoneRequired == 0 or myType == "melee") and CombatRunner.closeRange = false) or ((zoneRequired == 1 or myType == "cannon") and CombatRunner.closeRange = true)){
		warning = true
		requireText = "incorrect combat zone"
	}
}