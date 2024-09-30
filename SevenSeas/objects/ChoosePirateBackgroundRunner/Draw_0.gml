/// @description Draw Background

if (view_current == 0)
{
draw_background(PirateChooseWater, drawX - background_get_width(PirateChooseWater), 0)
draw_background(PirateChooseWater, drawX, 0)

draw_background_ext(PirateChooseWater, drawX*2 + background_get_width(PirateChooseWater), room_height, 1, 1, 180, c_white, 0.4)
draw_background_ext(PirateChooseWater, drawX*2, room_height, 1, 1, 180, c_white, 0.4)
draw_background_ext(PirateChooseWater, drawX*2 - background_get_width(PirateChooseWater), room_height, 1, 1, 180, c_white, 0.4)

with ChoosePirateShip
    {
    draw_sprite_ext(MapShipSpr, 0, x, y, image_xscale, 1, sin(rockAngle)*rockMax, c_white, 1)
    draw_sprite_ext(MapFlavorSpr, 3, x, y, image_xscale, 1, 0, c_white, 1)
    }

//draw_background(PirateChooseWater, 0, 0)
draw_background(PirateChooseBack, 0, 0)

drawBanner = false
with ChoosePirateParent
    if y = 64
        other.drawBanner = true
        
if drawBanner
    {
    draw_set_halign(fa_middle)
    draw_set_valign(fa_center)
    draw_set_color(make_colour_rgb(167,138,26))
    draw_set_font(global.LargePirateFont)
    draw_background(PirateChooseBanner, 0, 0)
    if instance_exists(ChooseFirstMate)
        draw_text(room_width/2, 33, string_hash_to_newline("Choose your first-mate"))
    else
        draw_text(room_width/2, 33, string_hash_to_newline("Choose your captain"))
    draw_set_font(global.PirateFont)
    }
}
