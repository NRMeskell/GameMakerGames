/// @description heal

with ActionParent 
    {
    if other.myShipTarget == Ship and enemyAction == false{
        if waitLeft > 1 waitLeft -= 1
	}
		
	if other.myShipTarget == CombatRunner and enemyAction == true
        if waitLeft > 1 waitLeft -= 1
	}
	
var medicalBonus;
if myShipTarget == Ship{
	medicalBonus = global.totalMedicalBonus
}else{
	medicalBonus = CombatRunner.myStats[3]
}

with myCrewTarget
	myHealth = min(maxHealth, round(myHealth + maxHealth*0.05))
