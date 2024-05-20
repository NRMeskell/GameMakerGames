/// @description Sound Vars

mySound = CannonSnd
lowRange = 0.5
highRange = 1.5

///vars

myButton = CannonSprayAction
image_speed = 0.8
image_index = 0
image_angle = 30
animationY = -10
animationX = 25
animationHeight = 2
animationWidth = 5
rotate = false

endRound = false
actionType = "cannon"

x = Ship.drawX + animationX + irandom_range(-animationWidth,animationWidth)
y = Ship.drawY + animationY + irandom_range(-animationHeight,animationHeight) + Ship.waveHeight

attackPower = global.totalCannonBonus
event_user(0)


