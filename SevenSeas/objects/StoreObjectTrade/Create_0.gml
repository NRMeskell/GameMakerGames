/// @description Vars

depth = -101
spriteIndex = StoreHealthSpr
itemNumber = 0

xWindow = 445 - (sprite_get_width(ItemSheetSpr) + 10) 
yWindow = room_height/2 - sprite_get_height(CargoSheetPreviewSpr)/2

closeX = xWindow + sprite_get_width(CargoSheetPreviewSpr)-2
closeY = yWindow + 2

overClose = false
preview = false
previewSelect = false

selected = false
overButton = false

viewed = false

type = 0
amount = 0
name = ""
description = ""
previewName = ""

drawX = 100
drawY = 100

alarm[0] = 1
alarm[1] = 2

cost = 0

