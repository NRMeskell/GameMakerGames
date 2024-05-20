/// @description clicked and clickable

if ds_list_size(CharacterCreator.scores) > 1
    startable = true
    
size = 1

if startable and !CharacterCreator.creatingCharacter
    {
    if point_in_rectangle(mouse_x, mouse_y, x - sprite_width/2, y - sprite_height/2, x + sprite_width/2, y + sprite_height/2)
        {
        size = 1.1
        
        if global.selectClick
            {
            audio_play_sound(ClickSound, 1, false)
            with CharacterCreator  
                event_user(1)
            }
        }
    }

///slide in from left

if x < myX
    x += abs(x-myX)*sqrt(global.timeDiff)/10

