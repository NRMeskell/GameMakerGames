/// @description Vars

buttonShift = sprite_get_width(ButtonSpr)/4 + 2

drawY = room_height/2
drawX = room_width/2
closed = false

size = 2

image_speed = 0
image_index = 0

textSize = 0
notificationSize = 0
captionSize = 0
onButtonRight = false
onButtonLeft = false
animationBorder = 20

eventTimerLength = room_speed * 6
eventTimer = eventTimerLength
eventSpeed = 15
eventFade = 5
depth = -999999
caption = "Exit to Main Menu?"

if SaveGameRunner.saveGameTimer < (room_speed * 60)
	text = "All progress will be saved."
else
	text = "Last save was " + string(SaveGameRunner.saveGameTimer div (room_speed*60)) + " minute(s) ago."

myEvent = 0
myDump = undefined


