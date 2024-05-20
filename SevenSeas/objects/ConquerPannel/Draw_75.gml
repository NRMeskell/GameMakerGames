/// @description Draw Stuff

swordShift = 20

drawHeight = sprite_get_height(SeaConqueredMapSpr)
drawWidth = sprite_get_width(SeaConqueredMapSpr)
//draw backing
draw_sprite_part_ext(SeaConqueredMapSpr, overScroll, edgeWidth + (panelWidth - scrollWidth), 0, scrollWidth*2, drawHeight, x - scrollWidth, y - 88, 1, 1, c_white, 1)

draw_surface_part(textSurface, panelWidth - scrollWidth, 0, scrollWidth*2, panelHeight*2, x- scrollWidth, y - panelHeight)
    
//draw edges
draw_sprite_part_ext(SeaConqueredMapSpr, overScroll, 0, 0, edgeWidth, drawHeight, x - scrollWidth - edgeWidth, y - 88, 1, 1, c_white, 1)
draw_sprite_part_ext(SeaConqueredMapSpr, overScroll, drawWidth - edgeWidth, 0, edgeWidth, drawHeight, x + scrollWidth, y - 88, 1, 1, c_white, 1)

if animating
    {
    if animation > swordLength
            draw_sprite(SeaConqueredSignSpr, animation -swordLength, x, y + swordShift)
    //if animation > 0
        {
        if animation < swordLength
            draw_sprite(SeaConqueredSwordSpr, animation, x, y + swordShift)
        else
            draw_sprite(SeaConqueredSwordSpr, sprite_get_number(SeaConqueredSwordSpr)-1, x, y + swordShift)
        }
    }
else if ds_map_find_value(MapCreator.seas[myCurrentSea], "conquered") == true
    {
    draw_sprite_part(SeaConqueredSignSpr, animation, 56 - scrollWidth, 0, scrollWidth*2, sprite_get_height(SeaConqueredSignSpr), x-scrollWidth + (scrollWidth == panelWidth)/2, y-42 + swordShift)
    draw_sprite_part(SeaConqueredSwordSpr, animation, 7 - scrollWidth, 0, scrollWidth*2, sprite_get_height(SeaConqueredSwordSpr), x-scrollWidth + (scrollWidth == panelWidth)/2, y-121 + swordShift)
    }

