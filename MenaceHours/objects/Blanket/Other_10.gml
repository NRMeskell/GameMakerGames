/// @description Draw Mini Game
// You can write your code in this editor

event_inherited()

draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_set_color(c_ltgray)

draw_sprite(BlanketBackSpr, 0, 0, 0)

var blankW = sprite_get_width(BlanketFolderSpr),
	blankH = sprite_get_height(BlanketFolderSpr),
	topY = ((height-28)-blankH*(max(fold[1], 1-fold[1])))/2,
    topX = (width-blankW*(max(fold[0], 1-fold[0])))/2;

//draw original backing
draw_sprite_part(BlanketFolderSpr, side, (blankW*(1-fold[0])) div 1, (blankH*(1-fold[1])) div 1, (blankW*fold[0]) div 1, (blankH*fold[1]) div 1, topX, topY)
//draw main horizontal fold
draw_sprite_part(BlanketFolderSpr, !side, (blankW*(fold[0])) div 1, (blankH*(1-fold[1])) div 1, (blankW*(1-fold[0])) div 1, (blankH*fold[1]) div 1, topX, topY+1)
//draw inner horizontal fold
draw_sprite_part(BlanketFolderSpr, side, (blankW*(fold[0])) div 1, (blankH*(fold[1])) div 1, (blankW*(1-fold[0])) div 1, (blankH*(1-fold[1])) div 1, topX-1, topY+1)
//draw main verticle fold
draw_sprite_part(BlanketFolderSpr, !side, (blankW*(1-fold[0])) div 1, (blankH*(fold[1])) div 1, (blankW*(fold[0])) div 1, (blankH*(1-fold[1])) div 1, topX-1, topY)

draw_text(width/2, height-12, "SPACE: fold   ESC: reset")