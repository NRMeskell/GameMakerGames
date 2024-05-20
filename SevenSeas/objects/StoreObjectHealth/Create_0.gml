/// @description Vars

spriteIndex = CargoSpr
itemNumber = 6

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

name = ""
description = ""
previewName = ""
amount = 0

drawX = 100
drawY = 100

cost = 0

alarm[0] = 2
alarm[1] = 2

