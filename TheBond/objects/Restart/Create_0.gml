/// @description Create

myColor = c_gray
textColor = c_black
borderColor = c_dkgray
width = 70
height = 28
drawX = 0
drawY = -13
textString = "Level " + string(ds_list_find_index(GameRunner.levelList, room) + 1) + ":"

button1 = instance_create(x - 32, y + 11, ButtonParent)

with button1
    {
    myColor = c_ltgray
    textColor = c_black
    width = 30
    height = 10
    textString = "restart"
    myAction = RestartLevel
	overButton = false
    }
    
button2 = instance_create(x + 32, y + 11, ButtonParent)

with button2
    {
    myColor = c_ltgray
    textColor = c_black
    width = 30
    height = 10
    textString = "menu"
    myAction = BackToMenu
	overButton = false
    }

