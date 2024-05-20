/// @description clicked

if collision_point(mouse_x,mouse_y,id,true,false)
    {
    size = 1.1
    if global.selectClick
        {
        game_end()
        audio_play_sound(ClickSound, 1, false)
        }
    }
else
    {
    size = 1
    }
    
if y > myY
    y -= abs(y-myY)*sqrt(global.timeDiff)/(10)
else
	y = myY


