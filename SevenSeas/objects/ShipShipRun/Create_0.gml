/// @description Sound vars

mySound = ShipCreakSnd
myAnimationSound = noone
lowRange = 1.2
highRange = 1.5

///vars

image_speed = 0.8
myButton = BasicRunAction
animationY = -10
animationX = 40
animationHeight = 1
animationWidth = 1
criticalHit = false

actionType = "ship"

moveSpeed = 0
changeZones = false
endRound = false

event_user(0)

showDamage = true
hasAnimation = true

runSuccess = false
if myShipTarget = Ship
    successRate = min(100, 30 + global.totalWheelBonus*5)/100
else
    successRate = min(100, 30 + CombatRunner.stats[3]*5)/100

if random(1) < successRate + 0.01
    {
    damage = "success"
    runSuccess = true
    }
else
    damage = "fail"



