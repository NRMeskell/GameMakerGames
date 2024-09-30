with (other) {
///Vars

state = "floating"

image_index = 0
image_speed = 0
image_alpha = 0

//sword, gun, cannon, wheel, sailing, lookout, medic, barder, survival
selected = false

sprite_index = noone
colorSprite = noone
itemName = "none"
itemNumber = 0
itemInfo = "none"
myAction = noone
canEquip = false
itemPower = "none"   
itemPowerDescription = "none"
myColor = c_white
myPirate = noone

marked = false
        

cost = 0

for(i=0; i<9; i++)
    bonus[i] = 0

twoHanded = false
damage = 0
accuracy = 0
overItem = false


}
///Drawing Vars

overLeft = false
overRight = false
infoBoxY = 58
drawWidth = 40
drawHeight = 20
if state == "equipped"
    drawX = Pirate.xWindow+sprite_get_width(PirateSheetSpr)
else if state == "floating"
    drawX = room_width - sprite_get_width(ItemSheetSpr) - 20

yWindow = room_height*1/2-sprite_get_height(PirateSheetSpr)/2 +10
    
drawY = yWindow+drawHeight
drawX = room_width - sprite_get_width(ItemSheetSpr)/2
infoTextSize = string_height_ext(string_hash_to_newline(itemInfo), 12, sprite_get_width(ItemSheetSpr)-drawWidth)
infoTextHeight = max(infoBoxY + 20, infoBoxY + 10 + infoTextSize div 2)
lineHeight = max(infoBoxY + 10 + string_height_ext(string_hash_to_newline(itemInfo), 12, sprite_get_width(ItemSheetSpr)-drawWidth), infoBoxY + 45)

