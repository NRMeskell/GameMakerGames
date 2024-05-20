/// @description Generate Pirate Traits 


depth = -100
GenerateAllPirateTraits()

global.JOLLY = 0
global.KEEN = 1
global.FEARSOME = 2
global.DARING = 3


//NOTES

displayPer[global.JOLLY] = "jolly"
displayPer[global.KEEN] = "clever"
displayPer[global.FEARSOME] = "fearsome"
displayPer[global.DARING] = "daring"

myMoraleReasons = ds_list_create()


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
legLostHealth = 0.15


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



///Real

showReal = false
selected = false

xReal = 100
yReal = 100

realWidth = 25
realHeight = 24

drawPictureRealx = 47 - realWidth/2
drawPictureRealy = 21 - realHeight/2


///Name Tag Vars

myTagPlace = 0
curlSpeed = 5
tagShift = Ship.tagShift
overSprite = false

drawTagPictureX = 17
drawTagPictureY = 8
drawTagPictureWidth = 32
drawTagPictureHeight = 29

drawTagSpriteX = 31
drawTagSpriteY = 5

tagDistance = sprite_get_height(PirateListSpr)

draw_set_font(global.PirateFont)
nameTagStart = 20
nameTagMin = nameTagStart + 60
nameTagLength = nameTagMin
nameTagMax = sprite_get_width(PirateListSpr)

///Stats

drawHeal = false
hungry = false

injured = false
stunned = false
exposed = false
bleeding = false
healed = 0
healModifier = 0
leveling = false

maxHealth = 60
myHealth = maxHealth
normHealth = maxHealth
deserter = false
healthTimer = 2

healthDiff = maxHealth
updateHealthDiff = false
healthDiffTimer = 0

statDrawY = 155
statDrawX = 55
statDrawDistance = 48

myGoal = "money"
myGoalProgress = 0

availableStats = ds_list_create()

myStats = ds_list_create()
myStatsSprDict = ds_map_create()
myStatsSprDict[? "wheel"] = 0
myStatsSprDict[? "sail"] = 1
myStatsSprDict[? "rigging"] = 2
myStatsSprDict[? "cannon"] = 4
myStatsSprDict[? "medical"] = 3
myStatsSprDict[? "survival"] = 5

for(i=0; i<9; i++)
    {
    statTotal[i] = 0
    stat[i] = 0
    statString[i] = ""
    haveItem[i] = false
    }

storeAmount = 0

myAction[0] = noone
myAction[1] = noone
myAction[2] = noone

morale = 0
prevMorale = 0
stars = 0


///Dump Pirate

dumpX = 208
dumpY = 265
overDump = false
walkPlank = false

