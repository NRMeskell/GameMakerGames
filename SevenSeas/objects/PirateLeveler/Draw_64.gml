/// @description draw self

draw_sprite(LevelUpSpr, 0, x, y)

draw_set_font(global.LargePirateFont)
draw_set_color(make_color_rgb(158, 126, 2))
draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_text(x, y-70, string_hash_to_newline("level up"))

draw_set_font(global.PirateFont)
draw_set_color(c_black)
draw_text_ext(x, y, string_hash_to_newline(myPirate.name + " gained an action and health!##choose their new action:"), 12, 120) 

for(i=0; i<2; i++)
    {            
    if overButton[i]
        {        
        draw_sprite_ext(PlayerAttackFrameSpr, 0, buttonx[i], buttony, 1, 1, 0, c_ltgray, 1)
        startX = x - sprite_get_width(ActionInfoSpr)/2 - 40
        drawInfoY = y + 10
        
        DrawActionInfo(action[i], startX, drawInfoY, true, "pirate", undefined)
        }
    else
        {
        draw_sprite_ext(PlayerAttackFrameSpr, 0, buttonx[i], buttony, 1, 1, 0, c_white, 1)
        }
        
    DrawAction(action[i], buttonx[i], buttony, 1)
    }

