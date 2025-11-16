/// @description Sound Vars

mySound = GunShotSnd
lowRange = 0.6
highRange = 0.7

///vars
image_speed = 0.8
image_index = 0
animationY = -60
animationX = 30
animationHeight = 10
animationWidth = 30

actionType = "ranged"

x = Ship.drawX + animationX + irandom_range(-animationWidth, animationWidth)
y = Ship.drawY + animationY + irandom_range(-animationHeight, animationHeight) + Ship.waveHeight

event_user(0)
attackPower = 6
singleAttack = false

