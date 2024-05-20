/// @description clicked

if !instance_exists(Credits){
if collision_point(mouse_x,mouse_y,id,true,false)
    {
    size = 1.1
    if global.selectClick
        {
        instance_create(room_width/2, room_height/2, Credits)
        audio_play_sound(ClickSound, 1, false)
        }
    }
else
    {
    size = 1
    }
}
    
if y > myY
    y -= abs(y-myY)*sqrt(global.timeDiff)/(10)
else
	y = myY


