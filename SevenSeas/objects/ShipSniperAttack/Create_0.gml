/// @description Sound Vars

mySound = SniperSnd
lowRange = 0.6
highRange = 0.7

///vars

myButton = SniperAction
image_speed = 0.8
image_index = 0
animationY = -30
animationX = 30
animationHeight = 2
animationWidth = 10

endRound = false
actionType = "ranged"

x = Ship.drawX + animationX + irandom_range(-animationWidth,animationWidth)
y = Ship.drawY + animationY + irandom_range(-animationHeight,animationHeight) + Ship.waveHeight

attackPower = global.totalGunBonus
event_user(0)
singleAttack = true

