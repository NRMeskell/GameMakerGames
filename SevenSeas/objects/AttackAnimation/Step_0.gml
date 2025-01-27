/// @description Attack Lighting

lightLayer = 2
if lightType == "melee"{
    red = 0.015
    green = 0.015
    blue = 0.02
    myVolume = 10*sqrt((image_number-image_index)/image_number)
    }
if lightType = "ranged"{
    red = 0.04
    green = 0.04
    blue = 0.03
    myVolume = 20*sqrt((image_number-image_index)/image_number)
    }
if lightType = "cannon"{
    red = 0.06
    green = 0.04
    blue = 0.04
    myVolume = 40*sqrt((image_number-image_index)/image_number)
    }
if lightType = "ship"{
    red = 0.0001
    green = 0.0001
    blue = 0.0001
    myVolume = 0.1*sqrt((image_number-image_index)/image_number)
    }
    
//Normalize Light Amounts
oldRed = red
oldGreen = green
oldBlue = blue

red = (red)/sqrt(oldRed + oldGreen + oldBlue)
green = (green)/sqrt(oldRed + oldGreen + oldBlue)
blue = (blue)/sqrt(oldRed + oldGreen + oldBlue)

mulVal = max(red, green, blue)

red = red/mulVal
green = green/mulVal
blue = blue/mulVal



