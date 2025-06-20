/// @description Make Pirate Traits

smallPirateSurface = undefined
fullPirateSurface = surface_create(sprite_get_width(PirateManSkinSpr), sprite_get_height(PirateManSkinSpr))
tagPirateSurface = undefined


GenerateAllPirateTraits()

///Limbs

rightHandType = 0
leftHandType = 1
leftHandSpr = PirateHookSpr
rightHandSpr = PirateHookSpr

eyesLost = 0
eyeLostRight = false
eyeLostLeft = false

handLostRight = false 
handLostLeft = false

legLostRight = false
legLostLeft = false

legsLost = 0


///Vars

xWindow = x
yWindow = y//room_height/2 - sprite_get_height(PirateSheetPreviewSpr)/2

closeX = xWindow + sprite_get_width(PirateSheetPreviewSpr)-2
closeY = yWindow + 2

overClose = false
preview = false

selected = false
overButton = false

viewed = false

drawX = x
drawY = y

///Stats

if instance_find(ChooseCaptain, 0) == id
    {
    global.attackTypeList = ds_list_create()
    ds_list_add(global.attackTypeList, 0,1,2,3)
    }
    
global.seaLevel = 0

selectedSpeed = 0
selectedSpeedChange = 1

drawHeal = false
hungry = false

healed = 0
healModifier = 0

maxHealth = 60
myHealth = maxHealth

statDrawY = 155
statDrawX = 55
statDrawDistance = 48

availableStats = ds_list_create()

myStats = ds_list_create()
myStatsSprDict = ds_map_create()
myStatsSprDict[? "wheel"] = 0
myStatsSprDict[? "sail"] = 1
myStatsSprDict[? "rigging"] = 2
myStatsSprDict[? "cannon"] = 4
myStatsSprDict[? "medical"] = 3
myStatsSprDict[? "survival"] = 5

for(var i=0; i<9; i++)
    {
    statTotal[i] = 0
    stat[i] = 0
    }

storeAmount = 0

myAction[0] = noone
myAction[1] = noone
myAction[2] = noone

morale = 0
stars = 0

///Equipment

drawY1 = 40 + 12
drawY2 = 75 + 12
drawY3 = 110 + 12

drawX1 = 11 + 12
drawX2 = 139 + 12

myShirt = instance_create(0,0,ItemParent)
myPants = instance_create(0,0,ItemParent)
myHat = instance_create(0,0,ItemParent)
myRightHand = instance_create(0,0,ItemParent)
myLeftHand = instance_create(0,0,ItemParent)
myPet = instance_create(0,0,ItemParent)

overHat = false
overShirt = false
overLeftHand = false
overRightHand = false
overPants = false
overPet = false

equipPopUp = false
overPopUp1 = false
overPopUp2 = false

drawColor0 = c_white
drawColor1 = c_white

dumpOptionX[0] = 0
dumpOptionX[1] = 0

dumpOptionY[0] = 0
dumpOptionY[1] = 0
dumpOptionY[2] = 0

hatSelected = false
shirtSelected = false
rightHandSelected = false
leftHandSelected = false

drawOptionsSpr = 2

EquipItem(id, MakeRandomShirtItem(0))
    
while true{
    var breakLoop = false
    if myShirt.bonus[5] > 0 or myShirt.bonus[6] != 0{
                breakLoop = true
        }
    if breakLoop
        break
    else{
		instance_destroy(myShirt)
		myShirt = instance_create(0,0,ItemParent)
        EquipItem(id, MakeRandomShirtItem(0))
	}
}
    
EquipItem(id, MakeRandomPantsItem(-1))       
EquipItem(id, MakeRandomHandItem(0))

PirateLevelUp(false, false)