/// @description Draw Lock

if GameRunner.currentLevel < myRoom
    {
    draw_sprite(LevelSprites, 0, x,y)
    }
else
    {
    draw_set_halign(fa_center)
    draw_set_valign(fa_center)
    draw_set_color(c_black)
    draw_text(x+1,y+1,string_hash_to_newline(myRoom))
    }

