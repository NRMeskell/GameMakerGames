/// @description Draw Lose Fade

room_speed = 90

if global.TownVictory = false
if TownHall.visible = false
    {
    draw_set_color(c_black)
    draw_set_alpha(0.5)
    draw_rectangle(0, 0, room_width, room_height, false)
    draw_set_font(GameOverFont)
    draw_set_alpha(1)
    draw_set_halign(fa_center)
    draw_set_valign(fa_center)
    draw_text(room_width/2, room_height/2, string_hash_to_newline("Game Over"))
    
    room_speed = 30
    }

///TownHall Victory

if global.TownVictory = true
    {
    with TownHall
        visible = false
        
    draw_sprite(TownHallSpr, TownHall.image_index, TownHall.x, TownHall.y)
    }

