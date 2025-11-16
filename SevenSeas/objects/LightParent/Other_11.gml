/// @description Normalize Light Amounts
var oldRed = red
var oldGreen = green
var oldBlue = blue

red = (red)/sqrt(oldRed + oldGreen + oldBlue)
green = (green)/sqrt(oldRed + oldGreen + oldBlue)
blue = (blue)/sqrt(oldRed + oldGreen + oldBlue)

mulVal = max(red, green, blue)

red = red/mulVal
green = green/mulVal
blue = blue/mulVal

if flickering = true
    alarm[1] = room_speed

