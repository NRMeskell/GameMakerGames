/// @description Sound Vars

mySound = ChainSnd
lowRange = 0.8
highRange = 1.2

///vars

myButton = ChainShotAction
image_speed = 0.8
image_index = 0
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

