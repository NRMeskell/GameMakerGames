/// @description Set damage vars

prevShipHealth = 0
prevCrewHealth = 0

with crewTarget
    other.prevCrewHealth += myHealth
with shipTarget
    other.prevShipHealth += myHealth
    
attackPower = GetAttackPower(actionType, myShipTarget == Ship)
