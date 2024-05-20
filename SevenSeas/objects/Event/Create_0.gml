/// @description Destroy if event exists

if instance_exists(Event)
    {
    if Event.id != id
        instance_destroy()
    }
	
instance_activate_object(EventDrawer)

///Vars

buttons = ds_list_create()
buttonStats = ds_list_create()
buttonText = ds_list_create()
buttonRequires = ds_list_create()
buttonCosts = ds_list_create()

showPictureStat = false
showPicture = false
statScale = 0.75
drawX = room_width*5/6
drawY = room_height/2 - 13 - sprite_get_height(EventSpr)/2
size = 2
image_speed = 0
image_index = 0
buttonSpacing = 17

buttonNumber = 0

textY = -40 - buttonNumber*buttonSpacing/2
buttonCenter = 32 + buttonNumber*buttonSpacing*3/7

for(i=0; i<3; i++)
    overButton[i] = false
		
eventValue = 0

requiredAmount = 0
requiredCost = 0
haveAmount = 0
haveCost = 0
myCharacter = -1

if ds_list_size(global.crewList) == 1
    myPirate = ds_list_find_value(global.crewList, 0)
else
    myPirate = ds_list_find_value(global.crewList, 1)

//audio_play_sound(DingSnd, 1, false)
openSound = audio_play_sound(OpenMenuSnd, 1, false)
audio_sound_pitch(openSound, 1.1)

buttonAdjust[0] = irandom(global.seaLevel)
buttonAdjust[1] = irandom(global.seaLevel)
buttonAdjust[2] = irandom(global.seaLevel)

global.moraleBoost = "event"

instance_create(0,0,CollectionCounter)





