/// @description Create Character

global.timeDiff = 1

inMenu = true

randomize();

stickPressedDown = false
changingBindings = false
characterSelect = 0

inputControllerList = ds_list_create()
controllerInputNumList = ds_list_create()
joyStickList = ds_list_create()
leftButtonList = ds_list_create()
rightButtonList = ds_list_create()
upButtonList = ds_list_create()
throwButtonList = ds_list_create()
headList = ds_list_create()
shirtList = ds_list_create()
pantsList = ds_list_create()
skinList = ds_list_create()



creatingCharacter = false
bindingSelect = 0

global.loopBreaker = 0

///keyName dictonary

mainFont = font_add_sprite(FontSpr, ord("!"), true, 3)
mainSmallFont = font_add_sprite(SmallFontSpr, ord("!"), true, 3)
winnerFont = font_add_sprite(WinnerFontSpr, ord("!"), true, 3)
draw_set_font(mainFont)

keyNames = ds_map_create()
ds_map_add(keyNames, 37, "LEFT")
ds_map_add(keyNames, 39, "RIGHT")
ds_map_add(keyNames, 40, "DOWN")
ds_map_add(keyNames, 38, "UP")
ds_map_add(keyNames, 163, "RTCNTL")
ds_map_add(keyNames, 162, "LTCNTL")
ds_map_add(keyNames, 164, "LTALT")
ds_map_add(keyNames, 165, "RTALT")
ds_map_add(keyNames, 188, "<")
ds_map_add(keyNames, 190, ">")
ds_map_add(keyNames, 191, "?")
ds_map_add(keyNames, 186, ":")
ds_map_add(keyNames, 222, "\"")
ds_map_add(keyNames, 219, "{")
ds_map_add(keyNames, 221, "}")
ds_map_add(keyNames, 220, "|")
ds_map_add(keyNames, 189, "-")
ds_map_add(keyNames, 187, "+")
ds_map_add(keyNames, 16, "SHIFT")
ds_map_add(keyNames, 32, "SPACE")
ds_map_add(keyNames, 9, "TAB")
ds_map_add(keyNames, 27, "ESCAPE")
ds_map_add(keyNames, 46, "DELETE")
ds_map_add(keyNames, 13, "ENTER")
ds_map_add(keyNames, 20, "CAPSLK")
ds_map_add(keyNames, 192, "~")
ds_map_add(keyNames, 32769, "BUTTON1")
ds_map_add(keyNames, 32770, "BUTTON2")
ds_map_add(keyNames, 32771, "BUTTON3")
ds_map_add(keyNames, 32772, "BUTTON4")
ds_map_add(keyNames, 32787, "PAD-UP")
ds_map_add(keyNames, 32782, "PAD-DN")
ds_map_add(keyNames, 32783, "PAD-LT")
ds_map_add(keyNames, 32784, "PAD-RT")
ds_map_add(keyNames, 32777, "SELECT")
ds_map_add(keyNames, 32778, "START")
ds_map_add(keyNames, 32775, "LTTRGR")
ds_map_add(keyNames, 32773, "LTBMPR")
ds_map_add(keyNames, 32776, "RTTRGR")
ds_map_add(keyNames, 32774, "RTBMPR")

ds_map_add(keyNames, ord(vk_numpad0), "NMPD-0")
ds_map_add(keyNames, ord(vk_numpad1), "NMPD-1")
ds_map_add(keyNames, ord(vk_numpad2), "NMPD-2")
ds_map_add(keyNames, ord(vk_numpad3), "NMPD-3")
ds_map_add(keyNames, ord(vk_numpad4), "NMPD-4")
ds_map_add(keyNames, ord(vk_numpad5), "NMPD-5")
ds_map_add(keyNames, ord(vk_numpad6), "NMPD-6")
ds_map_add(keyNames, ord(vk_numpad7), "NMPD-7")
ds_map_add(keyNames, ord(vk_numpad8), "NMPD-8")
ds_map_add(keyNames, ord(vk_numpad9), "NMPD-9")


///CharacterStand Values

characterHeight = sprite_get_height(MenuFootSpr) + sprite_get_height(MenuLegSpr) + sprite_get_height(MenuBodySpr) + 7

standx[0] = 576
standx[1] = 672
standx[2] = 480
standx[3] = 768
standx[4] = 384
standx[5] = 864
standDef = 260
for(i=0; i<=6; i++)
    standy[i] = 0
    
standCharHead = standDef - characterHeight

mouseOverCharacter = -1
lastStage = -1

///Creating Character Menu

drawStartx = room_width/2
drawStarty = room_height/2
drawDistancex = 100
drawDistancey = 20
characterSize = 1
arrowWidth = 80
frameWidth = 250
frameHeight = 350
bindingDrawDistance = 75

menuButtonHeight[0] = drawStarty - 110
menuButtonHeight[1] = drawStarty - 55
menuButtonHeight[2] = drawStarty
menuButtonHeight[3] = drawStarty + 60
menuButtonHeight[4] = drawStarty + 80
menuButtonHeight[5] = drawStarty + 100
menuButtonHeight[6] = drawStarty + 120

menuButtonWidth[0] = 20
menuButtonWidth[1] = 20
menuButtonWidth[2] = 20
menuButtonWidth[3] = 8
menuButtonWidth[4] = 8
menuButtonWidth[5] = 8
menuButtonWidth[6] = 8

previousMouseX = 0
previousMouseY = 0

///Score List

//gamemodes: knockout, countdown, 

golfHoleNumber = 0
global.gameMode = "none"

gameOver = false
startingScore = 5
gamemodes[0] = "KNOCKOUT"
gamemodes[1] = "POINT PLAY"
gamemodes[2] = "COUNTDOWN"
gamemodes[3] = "MATCH PLAY"
gamemodes[4] = "TIME PLAY"
winner = 0


gamemode = gamemodes[0]

characterColors[0] = make_color_rgb(192, 0, 0)
characterColors[1] = make_color_rgb(49, 49, 195)
characterColors[2] = make_color_rgb(192, 192, 0)
characterColors[3] = make_color_rgb(0,192, 0)
characterColors[4] = make_color_rgb(176, 0, 197)
characterColors[5] = make_color_rgb(200, 140, 0)

scores = ds_list_create()
totalScores = ds_list_create()


///Display Settings

__view_set( e__VW.HPort, 0, display_get_gui_height( ))
__view_set( e__VW.WPort, 0, __view_get( e__VW.HPort, 0 )*960/540 )
display_set_gui_size(960, 540) 