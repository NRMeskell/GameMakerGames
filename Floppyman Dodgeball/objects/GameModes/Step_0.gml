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
            global.gameMode = "dodgeball"
            
            room = MenuRoom
            }
        if image_index = 1{
            global.gameMode = "golf"
            
            CharacterCreator.gamemode = CharacterCreator.gamemodes[3]
            CharacterCreator.startingScore = 6
            
            room = GolfMenuRoom
            }
        }
    }
    
if y > myY
    y -= abs(y-myY)*sqrt(global.timeDiff)/(10)


