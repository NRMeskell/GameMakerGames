/// @description Sound vars

mySound = ShipCreakSnd
myAnimationSound = CannonSnd
lowRange = 1.2
highRange = 1.5

///vars

image_speed = 0.8
animationY = -10
animationX = 40
animationHeight = 1
animationWidth = 1

actionType = "ship"

moveSpeed = 2
changeZones = true

event_user(0)

x = myShipTarget.drawX + animationX
y = myShipTarget.drawY + animationY

showDamage = false
hasAnimation = true
if myShipTarget = Ship
    {
    damage = UpdateDamage(global.totalWheelBonus*10, true)
    myDamage = global.totalWheelBonus*2
    }
else
    {
    damage = UpdateDamage(attackPower*10, false)
    myDamage = attackPower*2
    }


