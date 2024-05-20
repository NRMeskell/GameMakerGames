/// @description slide in from left

if x < myX
    x += abs(x-myX)*sqrt(global.timeDiff)/10

///clicked

if collision_point(mouse_x,mouse_y,id,true,false)
    {
    size = 1.1
    if global.selectClick
        {
        audio_play_sound(ClickSound, 1, false)
        with all {
            if object_index != CharacterCreator and object_index != SoundController
                instance_destroy()
        }
        room = PartyPackRoom
        }
    }
else
    {
    size = 1
    }


