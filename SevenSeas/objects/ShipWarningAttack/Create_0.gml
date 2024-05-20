/// @description Sound Vars

mySound = WarningSnd
lowRange = 0.85
highRange = 1.1

///vars

myButton = WarningShotAction
image_speed = 0.8
image_index = 0
animationY = -10
animationX = 30
animationHeight = 2
animationWidth = 5
rotate = false

endRound = true
actionType = "cannon"

x = Ship.drawX + animationX + irandom_range(-animationWidth,animationWidth)
y = Ship.drawY + animationY + irandom_range(-animationHeight,animationHeight) + Ship.waveHeight

attackPower = global.totalCannonBonus
event_user(0)
singleAttack = true


