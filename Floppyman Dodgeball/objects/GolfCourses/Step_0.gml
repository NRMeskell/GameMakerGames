/// @description clicked and clickable

    
size = 1

if ds_list_size(CharacterCreator.scores) > 1
    startable = true



if startable and point_in_rectangle(mouse_x, mouse_y, x - sprite_width/2, y - sprite_height/2, x + sprite_width/2, y + sprite_height/2)
    {
    size = 1.1
    
    if global.selectClick
        {
        audio_play_sound(ClickSound, 1, false)
        if image_index = 0{
            global.firstHole = NewMap1
            }
        if image_index = 1{
            global.firstHole = GolfMap1B
            }
		with GolfCourses
			selected = false
		selected = true
        }
    }
    
	
if image_index == 0 and global.firstHole == NewMap1
	selected = true
else if image_index == 1 and global.firstHole == GolfMap1B
	selected = true
else
	selected = false
	
	
if y > myY
    y -= abs(y-myY)*sqrt(global.timeDiff)/(10)


