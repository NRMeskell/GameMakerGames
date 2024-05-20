/// @description Create Menu

with instance_create(room_width/2, room_height/2-30, ButtonParent)
    {
    myColor = merge_color(c_lime, c_black, 0.25)
    textColor = c_black
    width = 55
    height = 15
    textString = "new game"
    myAction = StartGame
	overButton = false
    }
    
with instance_create(room_width/2, room_height/2+10, ButtonParent)
    {
    myColor = merge_color(c_yellow, c_black, 0.25)
    textColor = c_black
    width = 55
    height = 15
    textString = "Level Select"
    myAction = LevelSelect
	overButton = false
    }
    
with instance_create(room_width/2, room_height/2+50, ButtonParent)
    {
    myColor = merge_color(c_orange, c_black, 0.25)
    textColor = c_black
    width = 55
    height = 15
    textString = "credits"
    myAction = OpenCredits
	overButton = false
    }
    
with instance_create(room_width/2, room_height/2+90, ButtonParent)
    {
    myColor = merge_color(c_red, c_black, 0.25)
    textColor = c_black
    width = 55
    height = 15
    textString = "exit game"
    myAction = ExitGame
	overButton = false
    }

