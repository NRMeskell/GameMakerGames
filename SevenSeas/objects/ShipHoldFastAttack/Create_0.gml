/// @description Sound Vars

mySound = ShieldsSnd
lowRange = 0.85
highRange = 1.1

///vars

image_speed = 0.8
image_index = 0
animationY = - 35
animationX = 30
animationHeight = 2
animationWidth = 10
image_yscale = 1

endRound = true
actionType = "melee"

x = Ship.drawX + animationX + irandom_range(-animationWidth,animationWidth)
y = Ship.drawY + animationY + irandom_range(-animationHeight,animationHeight) + Ship.waveHeight

attackPower = 0
event_user(0)
event_user(2)
showDamage = false

