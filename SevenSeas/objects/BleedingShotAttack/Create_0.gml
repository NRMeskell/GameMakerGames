/// @description Sound Vars

mySound = BloodySnd
lowRange = 0.75
highRange = 0.9

///vars

myButton = BleedingShotAction
image_speed = 0.8
image_index = 0
animationY = - 30
animationX = 30
animationHeight = 2
animationWidth = 10

endRound = false
actionType = "ranged"

x = Ship.drawX + animationX
y = Ship.drawY + animationY + Ship.waveHeight

attackPower = global.totalGunBonus
event_user(0)

