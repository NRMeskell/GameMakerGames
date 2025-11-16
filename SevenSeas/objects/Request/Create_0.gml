/// @description Destroy if event exists

if global.eventOpen
    {
    if Event.id != id
        instance_destroy()
    }

///Vars

captionText = "request"
eventText = "placeholder text: a test"

buttons = ds_list_create()

showPictureStat = false
showPicture = false
statScale = 0.75
drawX = room_width*5/6
drawY = room_height/2 - 13 - sprite_get_height(EventSpr)/2
size = 2
image_speed = 0
image_index = 0
buttonSpacing = 18

buttonNumber = 0

textY = -40 - buttonNumber*buttonSpacing/2
buttonCenter = 0

for(i=0; i<2; i++)
    overButton[i] = false
    
eventValue = 0

if ds_list_size(global.crewList) == 1
    myPirate = ds_list_find_value(global.crewList, 0)
else
    myPirate = ds_list_find_value(global.crewList, 1)

//audio_play_sound(DingSnd, 1, false)
openSound = audio_play_sound(OpenMenuSnd, 1, false)
audio_sound_pitch(openSound, 1.1)

global.moraleBoost = "request"





