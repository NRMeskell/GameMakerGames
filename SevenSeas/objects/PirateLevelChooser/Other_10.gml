/// @description Insert description here
// You can write your code in this editor

/// @description vars

depth = -100000
x = -1000

buttonNumber = myPirate.stars

buttonMax = (myPirate.stars-1)*25
buttonWidth = buttonMax*(1+(myPirate.stars mod 2 == 0))
buttony = y + 74
for(var i=0; i<buttonNumber; i++)
    {
    buttonx[i] = 0
    overButton[i] = false
    action[i] = noone
    }

upNext = false
depth += instance_number(PirateLeveler)

alarm[2] = 1
overDecline = false

