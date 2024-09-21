/// @description Sound vars

mySound = ShipCreakSnd
myAnimationSound = ShipCreakSnd
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
hasAnimation = false

runSuccess = false
if irandom(1)
    {
    damage = "success"
    runSuccess = true
    }
else
    damage = "failure"



