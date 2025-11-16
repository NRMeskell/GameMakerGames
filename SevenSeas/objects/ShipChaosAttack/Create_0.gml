/// @description Sound Vars

mySound = ChaosSnd
lowRange = 0.5
highRange = 1.5

///vars

image_speed = 0.8
image_index = 0
animationY = - 30
animationX = 30
animationHeight = 2
animationWidth = 10

actionType = "ranged"

x = Ship.drawX + animationX + irandom_range(-animationWidth,animationWidth)
y = Ship.drawY + animationY + irandom_range(-animationHeight,animationHeight) + Ship.waveHeight

attackPower = global.totalGunBonus
event_user(0)
showDamage = false

