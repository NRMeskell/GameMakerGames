/// @description Sound Vars

mySound = HammerSnd
lowRange = 0.5
highRange = 0.7

///vars

myButton = HammerBlowAction
image_speed = 0.8
image_index = 0
animationY = -35
animationX = 30
animationHeight = 2
animationWidth = 10

endRound = true
actionType = "melle"

x = Ship.drawX + animationX + irandom_range(-animationWidth,animationWidth)
y = Ship.drawY + animationY + irandom_range(-animationHeight,animationHeight) + Ship.waveHeight

attackPower = global.totalSwordBonus
event_user(0)
singleAttack = true