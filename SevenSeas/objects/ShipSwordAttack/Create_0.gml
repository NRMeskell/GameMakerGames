/// @description vars

image_speed = 0.8
image_index = 0
animationY = - 35
animationX = 30
animationHeight = 2
animationWidth = 10

endRound = false
actionType = "melee"

x = Ship.drawX + animationX + irandom_range(-animationWidth,animationWidth)
y = Ship.drawY + animationY + irandom_range(-animationHeight,animationHeight) + Ship.waveHeight

attackPower = global.totalSwordBonus
event_user(0)

///Sound Vars

mySound = SwordSnd
lowRange = 0.85
highRange = 1.1

