/// @description Set vars

criticalHit = irandom(99) < 10

crewTarget = Enemy
shipTarget = CombatRunner
myCrewTarget = Pirate
myShipTarget = Ship

singleAttack = false
showDamage = true
waiting = true
damageColor = merge_color(c_green, c_black, 0.2)

if !instance_exists(myButton)
    with instance_create(-100, -200, myButton)
        {
        pirateDrawTest = true
        event_user(2)
        }
        
prevShipHealth = 0
prevCrewHealth = 0
event_user(3)

