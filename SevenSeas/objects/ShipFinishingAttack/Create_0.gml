/// @description Sound Vars

mySound = BloodySwordSnd
lowRange = 0.85
highRange = 1.1

///vars

myButton = FinishingStabAction
image_speed = 0.8
image_index = 0
animationY = - 35
animationX = 30
animationHeight = 2
animationWidth = 10

endRound = false
actionType = "melle"

x = Ship.drawX + animationX + irandom_range(-animationWidth,animationWidth)
y = Ship.drawY + animationY + irandom_range(-animationHeight,animationHeight) + Ship.waveHeight

attackPower = global.totalSwordBonus
event_user(0)
