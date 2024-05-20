function DrawLandMenu() {
	draw_sprite_part(LandMenuSpr, 0, 0, 0, sprite_get_width(LandMenuSpr), currentHeight, x-sprite_get_width(LandMenuSpr)/2, y-currentHeight)
	buffer = 3
	drawHeight = (106 - sprite_get_height(LandMenuButtonSpr)/2 - buffer*2)/buttonNumber
	drawStart = 21 + sprite_get_height(LandMenuButtonSpr)/2 + buffer

	if currentHeight > 0
	    {
	    draw_set_halign(fa_center)
	    draw_set_font(global.PirateFont)
	    draw_set_valign(fa_center)
	    draw_set_color(c_black)
	    draw_text(x,y-currentHeight+9, string_hash_to_newline(myName))
	    for(i=0; i<buttonNumber; i++)
	        {
	        drawButtonHeight = currentHeight-drawHeight*i-drawStart
	        if drawButtonHeight > sprite_get_height(LandMenuButtonSpr)/2
	            {
	            if overMenuButton[i]
	                draw_sprite_ext(LandMenuButtonSpr, 0, x, y - drawButtonHeight, 1, 1, 0, c_ltgray, 1)
	            else
	                draw_sprite_ext(LandMenuButtonSpr, 0, x, y - drawButtonHeight, 1, 1, 0, c_white, 1)
	            draw_text_ext(x, y - drawButtonHeight + 2, string_hash_to_newline(button[i]), 10, sprite_get_width(LandMenuButtonSpr)-4)
	            }
	        }
	    }



}
