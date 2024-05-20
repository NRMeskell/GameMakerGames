/// @description Set damage vars

prevShipHealth = 0
prevCrewHealth = 0

with crewTarget
    other.prevCrewHealth += myHealth
with shipTarget
    other.prevShipHealth += myHealth
    
if shipTarget == CombatRunner{
    if actionType == "melle"
        attackPower = global.totalSwordBonus
    else if actionType == "ranged"
        attackPower = global.totalGunBonus
    else if actionType == "cannon"
        attackPower = global.totalCannonBonus
    else
        attackPower = global.totalWheelBonus
    }
else{
    if actionType == "melle"
        attackPower = CombatRunner.myStats[0]
    else if actionType == "ranged"
        attackPower = CombatRunner.myStats[1]
    else if actionType == "cannon"
        attackPower = CombatRunner.myStats[2]
    else
        attackPower = CombatRunner.myStats[3]
    }

