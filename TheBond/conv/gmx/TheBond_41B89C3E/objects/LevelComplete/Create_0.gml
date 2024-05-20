/// @description Create

myColor = c_gray
textColor = c_black
borderColor = c_green
width = 70
height = 28
drawX = 0
drawY = -13
textString = "LEVEL " + string(room) + " SOLVED!"

with instance_create(x - 32, y + 11, ButtonParent)
    {
    myColor = c_ltgray
    textColor = c_black
    width = 30
    height = 10
    textString = "next"
    myAction = NextLevel
    }
    
with instance_create(x + 32, y + 11, ButtonParent)
    {
    myColor = c_ltgray
    textColor = c_black
    width = 30
    height = 10
    textString = "menu"
    myAction = BackToMenu
    }

