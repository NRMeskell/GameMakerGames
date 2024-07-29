/// @description Make Pirate Traits

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

cost = min(0, irandom_range(5,10))

///Backstory
backStart[0] = "Hello there captain! "
backStart[1] = "Hello! "
backStart[2] = "Arr there friend! "
backStart[3] = "Captain! "
backStart[4] = ""
backStart[5] = "Excuse me. "
backStart[6] = "Hello there! "
backStart[7] = "Over here! "

//Goal
if myGoal == "money"{
	backMiddle[0] = "I'm looking for a nice coin. "
	backMiddle[1] = "I want to get rich beyond belief! " 
	backMiddle[2] = "I want to find some treasure! "
	backMiddle[3] = "I hear there's lots of gold to find! "
	}
if myGoal == "love"{
	backMiddle[0] = "I'm looking for a crewmate to sail with. "
	backMiddle[1] = "I hope to find a love on the sea! " 
	backMiddle[2] = "Do you have room for a broken heart? "
	backMiddle[3] = "I need to find a matey for myself. "
	}
if myGoal == "adventure"{
	backMiddle[0] = "I'd like to explore the ocean. "
	backMiddle[1] = "The world is a wonderful place! "
	backMiddle[2] = "Do you have need of an adventurous soul? "
	backMiddle[3] = "I can hear the sea calling me! "
}
if myGoal == "action"{
	backMiddle[0] = "I'm looking to plunder the 7 seas! "
	backMiddle[1] = "I'm young, fit, strong, and ready for action. "	
	backMiddle[2] = "I'd like to taunt the hangmans noose! "
	backMiddle[3] = "Are you a menace on the 7 seas? "
}

//personality
if myMainPer == 0{
	backSecond[0] = "I Will bring plenty of stories to tell. "
	backSecond[1] = "No crew is complete without a good laugh! "
	backSecond[2] = "Are you gonna turn down such a nice fellow? "
}
if myMainPer == 2{
	backSecond[0] = "I will not allow our crew to be defeated! "
	backSecond[1] = "Every crew needs a little discipline. "
	backSecond[2] = "Are you sure you want to say no? "
}
if myMainPer == 1{
	backSecond[0] = "I noticed you're a little low on crew... "
	backSecond[1] = "Every crew needs a lookout. "
	backSecond[2] = "Have you ever seen such an observant sailor? "
}
if myMainPer == 3{
	backSecond[0] = "I will bring adventure to your trip! "
	backSecond[1] = "Every ship needs someone to go exploring. "
	backSecond[2] = "Can anyone on your ship do a backflip? "
}

backEnd[0] = "Will you let me on board?"
backEnd[1] = "What do you say?"
backEnd[2] = ""
backEnd[3] = "You won't regret having me aboard!"
backEnd[4] = "Hire me!"
backEnd[5] = "Bring me onto your ship captain!"
backEnd[6] = "I'd love to sail the seven seas with you!"
backEnd[7] = "I'm ready to work hard!"
backEnd[8] = "You could use a pirate like me!"
backEnd[9] = "You should take me on your ship!"

run = false
backstory = ""

while !run or string_height_ext(string_hash_to_newline(backstory), 12, sprite_get_width(PirateSheetPreviewSpr) - 30) > 100
    {
    myBackStart = backStart[irandom(array_length_1d(backStart)-1)]
    myBackMiddle = backMiddle[irandom(array_length_1d(backMiddle)-1)]
    myBackSecond = backSecond[irandom(array_length_1d(backSecond)-1)]
    myBackEnd = backEnd[irandom(array_length_1d(backEnd)-1)]
    
    backstory = PirateTalkTranslator(myBackStart + myBackMiddle + myBackSecond + myBackEnd, id)
    
    run = true
    }


///Vars

xWindow = 445 - (sprite_get_width(ItemSheetSpr) + 10) 
yWindow = room_height/2 - sprite_get_height(PirateSheetPreviewSpr)/2

closeX = xWindow + sprite_get_width(PirateSheetPreviewSpr)-2
closeY = yWindow + 2

overClose = false
preview = false
previewSelect = false

selected = false
overButton = false

viewed = false

drawX = 100
drawY = 100

realWidth = 30
realHeight = 30
drawPictureRealx = 47 - realWidth/2
drawPictureRealy = 21 - realHeight/2

cost = irandom_range(5,10)

alarm[1] = 2
alarm[2] = 1
previewName = ""

fullPirateSurface = surface_create(sprite_get_width(PirateManSkinSpr), sprite_get_height(PirateManSkinSpr))
smallPirateSurface = surface_create(realWidth, realHeight);
tagPirateSurface = undefined

MakePirateSurface(fullPirateSurface, xWindow + xPicture, yWindow + yPicture) 
MakePirateSurface(smallPirateSurface, drawPictureRealx, drawPictureRealy) 


