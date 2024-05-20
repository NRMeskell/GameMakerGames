/// @description clicked and clickable

    
size = 1

if point_in_rectangle(mouse_x, mouse_y, x - sprite_width/2, y - sprite_height/2, x + sprite_width/2, y + sprite_height/2)
    {
    size = 1.1
    
    if global.selectClick
        {
        audio_play_sound(ClickSound, 1, false)
        room = PartyPackRoom
        }
    }
    
if y > myY
    y -= abs(y-myY)*sqrt(global.timeDiff)/(10)
else
	y = myY

