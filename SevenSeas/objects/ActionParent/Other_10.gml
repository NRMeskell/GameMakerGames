/// @description Create Basics

enemyAction = false
myAttack = noone

siwtchInfoY = 180
infoYGap = 5
drawWidth = sprite_get_width(ActionInfoSpr) - 32
nameY = 29
descY = 10
shiftX = -4
timerX = sprite_get_width(ActionInfoSpr) - 40
startX = 256+40

requiredTypeMap = ds_map_create()
ds_map_add(requiredTypeMap, "rigging", 3)
ds_map_add(requiredTypeMap, "wheel", 5)
ds_map_add(requiredTypeMap, "sail", 4)
ds_map_add(requiredTypeMap, "cannon", 2)
ds_map_add(requiredTypeMap, "medical", 6)

animationNumber = 0
image_speed = 0
selected = false

canUse = true
waitLeft = 0
needsTarget = false
myTarget = noone
requiredSlot[0] = "none"
myPirate = noone
pirateDrawTest = false
zoneRequired = -1
drawInfo = false
petAction = false
canUse = true
priority = -1

arrowHeightTimer = 0
