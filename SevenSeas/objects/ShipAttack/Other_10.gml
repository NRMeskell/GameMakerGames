/// @description Set vars

crewTarget = Enemy
shipTarget = CombatRunner
myCrewTarget = Pirate
myShipTarget = Ship

moveSpeed = moveSpeed*global.combatRate
isClose = CombatRunner.closeRange

singleAttack = true
hasAnimation = false
showDamage = false
criticalHit = false
waiting = true
endRound = false
damageColor = merge_color(c_green, c_black, 0.2)
    
if !instance_exists(myButton)
    with instance_create(-100, -200, myButton)
        {
        pirateDrawTest = true
        event_user(2)
        }
    
prevShipHealth = 0
prevCrewHealth = 0

lightType = "ship"
    

