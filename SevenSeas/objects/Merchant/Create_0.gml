/// @description Add vars and looks

myShipTypes[0] = MerchantSmallSpr
myShipTypes[1] = MerchantMediumSpr
myShipTypes[2] = MerchantLargeSpr
myShipTypes[3] = MerchantLargeSpr

flagX[0] = 39 - sprite_get_xoffset(MerchantSmallSpr)
flagX[1] = 52 - sprite_get_xoffset(MerchantMediumSpr)
flagX[2] = 57 - sprite_get_xoffset(MerchantLargeSpr)
flagX[3] = 57 - sprite_get_xoffset(MerchantLargeSpr)

flagY[0] = 0 - sprite_get_yoffset(MerchantSmallSpr)
flagY[1] = 4 - sprite_get_yoffset(MerchantMediumSpr)
flagY[2] = 14 - sprite_get_yoffset(MerchantLargeSpr)
flagY[3] = 14 - sprite_get_yoffset(MerchantLargeSpr)

myShipHull = myShipTypes[global.seaLevel]

color[0] = make_color_rgb(155,0,0)
color[1] = make_color_rgb(128,0,0)
color[2] = make_color_rgb(0,44,119)
color[3] = make_color_rgb(158,126,2)
color[4] = make_color_rgb(140,0,145)

flagColor = color[irandom(array_length_1d(color)-1)]
flagSprite = ColorFlagSpr

///Common enemy vars

name = "Merchant Ship"
maxHealth = 50 + 25*(global.seaLevel+1)
myHealth = maxHealth
image_index = 1
enemyLevel = 1

myBasicActions = ds_list_create()
ds_list_add(myBasicActions, BasicMelleAction, BasicRangedAction, BasicShipAction)


//Crew
myCrew[0] = MerchantCrew
myCrew[1] = MerchantCrew
myCrew[2] = ShipGaurd
myCrew[3] = ShipGaurd

crewSize = irandom_range((global.seaLevel + 2), (global.seaLevel + 1)*2)

instance_create(0,0,MerchantCaptain)

repeat((global.seaLevel*2+1+irandom(1)))
    instance_create(0,0,myCrew[irandom(global.seaLevel)])
   

event_user(2)

