/// @description Sound vars

mySound = ShipCreakSnd
myAnimationSound = CannonSnd
lowRange = 1.2
highRange = 1.5

///vars

image_speed = 0.8
myButton = RammingAction
animationY = -10
animationX = 40
animationHeight = 1
animationWidth = 1

actionType = "ship"

moveSpeed = 2
changeZones = true
endRound = true

event_user(0)

x = myShipTarget.drawX + animationX
y = myShipTarget.drawY + animationY

endRound = true

showDamage = false
hasAnimation = true
if myShipTarget = Ship
    {
    damage = UpdateDamage(global.totalWheelBonus*10, "ship")
    myDamage = global.totalWheelBonus*2
    }
else
    {
    damage = UpdateEnemyDamage(attackPower*10, "ship")
    myDamage = attackPower*2
    }


