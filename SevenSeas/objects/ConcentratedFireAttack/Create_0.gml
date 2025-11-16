/// @description Sound Vars

mySound = CannonSnd
lowRange = 1
highRange = 1

///vars

image_speed = 0.8
image_index = 0
animationY = -10
animationX = 30
animationHeight = 0
animationWidth = 0
rotate = false


actionType = "cannon"

x = Ship.drawX + animationX + irandom_range(-animationWidth,animationWidth)
y = Ship.drawY + animationY + irandom_range(-animationHeight,animationHeight) + Ship.waveHeight

attackPower = global.totalCannonBonus
event_user(0)


