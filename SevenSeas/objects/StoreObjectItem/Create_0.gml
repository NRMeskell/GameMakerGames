/// @description Vars

//sword, gun, cannon, wheel, sailing, lookout, medic, barder, survival

xWindow = 445 - (sprite_get_width(ItemSheetSpr) + 10) 
yWindow = room_height/2 - sprite_get_height(ItemSheetSpr)/2 + 15

closeX = xWindow + sprite_get_width(ItemSheetSpr)-2
closeY = yWindow + 2

overClose = false
preview = false
previewSelect = false

selected = false
overButton = false

viewed = false

drawX = 0
drawY = 0

spriteIndex = noone
myColor = c_white
itemName = "none"
itemNumber = 0
itemInfo = "none"
myAction = noone
itemPowerDescription = ""

cost = 0

for(i=0; i<9; i++)
    bonus[i] = 0

twoHanded = false
damage = 0
accuracy = 0

doLevel = true
hidden = false

alarm[1] = 2
depth = -101

