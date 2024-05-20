/// @description Create

buttonDistance = 32

levelButtonPlacements[0] = 0
levelButtonPlacements[1] = buttonDistance
levelButtonPlacements[2] = buttonDistance*2
levelButtonPlacements[3] = buttonDistance*3
levelButtonPlacements[4] = buttonDistance*4
levelButtonPlacements[5] = buttonDistance*5

roomNumber = 0
while room_exists(roomNumber+1)
    roomNumber ++

myColor = merge_color(c_gray, c_ltgray, 0.5)
textColor = c_black
borderColor = c_orange
width = (buttonDistance*array_length_1d(levelButtonPlacements))/2
height = (buttonDistance*((((roomNumber + 4) div array_length_1d(levelButtonPlacements)))))/2 + 15
drawX = 0
drawY = -height + 15
textString = "Level Selection"

for(r=0; r<((roomNumber+4) div array_length_1d(levelButtonPlacements)); r++)
    for(i=0; i<array_length_1d(levelButtonPlacements) and room_exists(r*array_length_1d(levelButtonPlacements)+i+1); i++)
        {
        with instance_create(x - width + buttonDistance/2 + levelButtonPlacements[i], y - height + buttonDistance + 7 + levelButtonPlacements[r], LevelButton)
            myRoom = other.r*array_length_1d(other.levelButtonPlacements)+other.i+1
        }


