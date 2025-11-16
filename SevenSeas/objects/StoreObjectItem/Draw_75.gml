/// @description Draw Preview
// You can write your code in this editor

if preview = true
{
///Draw info

infoBoxY = 58
drawWidth = 40
drawHeight = 20

infoTextSize = string_height_ext(string_hash_to_newline(itemInfo), 12, sprite_get_width(ItemSheetSpr)-drawWidth)
infoTextHeight = max(infoBoxY + 25, infoBoxY + 10 + infoTextSize div 2)
lineHeight = max(infoBoxY + 10 + string_height_ext(string_hash_to_newline(itemInfo), 12, sprite_get_width(ItemSheetSpr)-drawWidth), infoBoxY + 45)

draw_set_color(c_yellow)
//draw_text(100,50 + selected*25, itemNumber)
draw_sprite(ItemSheetSpr, 0, xWindow, yWindow)
DrawItem(spriteIndex, itemNumber, myColor, xWindow+28-12, yWindow + 34-12, 0, 0, sprite_get_width(spriteIndex), sprite_get_height(spriteIndex))

draw_set_halign(fa_left)
draw_set_valign(fa_center)
draw_set_color(c_black)
draw_text(xWindow+60, yWindow+drawHeight+17, string_hash_to_newline(itemName))

draw_sprite_part(ItemSheetSpr, 2, 0, 0, sprite_get_width(ItemSheetSpr), lineHeight -(infoBoxY), xWindow, yWindow+infoBoxY)
draw_sprite_part(ItemSheetSpr, 2, 0, 210, sprite_get_width(ItemSheetSpr), 5, xWindow, yWindow + lineHeight)


draw_set_halign(fa_center)
draw_text_ext(xWindow+sprite_get_width(ItemSheetSpr)/2, yWindow+infoTextHeight, string_hash_to_newline(itemInfo), 12, sprite_get_width(ItemSheetSpr)-drawWidth)

draw_sprite(ItemSheetSpr, 1, xWindow, yWindow+lineHeight + 10)

//Draw Damage and accuracy
if damage != 0
    {
    draw_set_halign(fa_center)
    draw_set_valign(fa_top)
    draw_set_color(make_color_rgb(158,126,2))
    draw_set_font(global.LargePirateFont)
    
    draw_text_ext(xWindow+sprite_get_width(ItemSheetSpr)/2, yWindow+lineHeight + 30, string_hash_to_newline("accuracy: " + string(accuracy) + "#damage: " + string(damage)), 16, sprite_get_width(ItemSheetSpr)-drawWidth)
    }

//Draw Bonuses
drawStartY = yWindow+drawHeight + lineHeight + 20
drawStatDisX = 48
drawStatDisY = 23
textShift = 28
centerOffset = 5

rowStart[0] = xWindow+sprite_get_width(ItemSheetSpr)/2 + centerOffset
rowStart[1] = xWindow+sprite_get_width(ItemSheetSpr)/2 + centerOffset
rowStart[2] = xWindow+sprite_get_width(ItemSheetSpr)/2 + centerOffset

//Collect stat info
r = 0
for(i=0; i < array_length_1d(bonus); i++)
    {
    if bonus[i] != 0
        {
        rowStart[r div 3] -= drawStatDisX/2
        r ++
        }
    }
    
//Draw Stats  
r=0 
for(i=0; i < array_length_1d(bonus); i++)
    {
    if bonus[i] != 0
        {
        draw_set_halign(fa_left)
        draw_set_valign(fa_center)
        draw_set_color(make_color_rgb(158,126,2))
        draw_set_font(global.LargePirateFont)
        
        draw_sprite(StatSymbolSpr, i, rowStart[r div 3] + drawStatDisX*(r mod 3), drawStartY + drawStatDisY*(r div 3))
        draw_text(rowStart[r div 3] + drawStatDisX*(r mod 3) + textShift, drawStartY + drawStatDisY*(r div 3) + sprite_get_height(StatSymbolSpr)/2, string_hash_to_newline(bonus[i]))
        r ++
        }
    }
    
/*if overClose
    draw_sprite(EndCombatSpr, 1, xWindow + sprite_get_width(ItemSheetSpr)-2, yWindow+2)
else
    draw_sprite(EndCombatSpr, 0, xWindow + sprite_get_width(ItemSheetSpr)-2, yWindow+2)
*/    
    
draw_set_font(global.PirateFont)
//draw actions
if myAction != noone
    {
    DrawAction(myAction, xWindow+sprite_get_width(ItemSheetSpr)/2, drawStartY + drawStatDisY*((r div 3)+1) + 20 - sprite_get_height(PlayerAttackActionsSpr), 1)
    
    //Draw action info
    if instance_exists(Pirate)
    if point_in_rectangle(window_view_mouse_get_x(0), mouse_y, xWindow+sprite_get_width(ItemSheetSpr)/2 - 16, drawStartY + drawStatDisY*((r div 3)+1) + 20 - sprite_get_height(PlayerAttackActionsSpr) - 16, xWindow+sprite_get_width(ItemSheetSpr)/2 + 16, drawStartY + drawStatDisY*((r div 3)+1) + 20 - sprite_get_height(PlayerAttackActionsSpr) + 16)
        {
        startX = 25 + Pirate.xWindow - sprite_get_width(ActionInfoSpr)/2 + 8 + sprite_get_width(PirateSheetSpr)/2
        drawInfoY = Pirate.yWindow + 215+16 - 60
        
        DrawActionInfo(myAction, startX, drawInfoY, true, "pirate", undefined)
        }
    }

if itemPowerDescription != "" and itemPowerDescription != "none"
    {
    draw_set_halign(fa_center)
    draw_set_valign(fa_center)
    draw_set_color(c_black)
    draw_sprite_part(ItemSheetSpr, 2, 0, 0, sprite_get_width(ItemSheetSpr), 5, xWindow, yWindow+lineHeight + 20)
    draw_sprite_part(ItemSheetSpr, 2, 0, lineHeight + 42, sprite_get_width(ItemSheetSpr), sprite_get_height(ItemSheetSpr) - (lineHeight + 50), xWindow, yWindow+lineHeight + 25)
            
    draw_text_ext(xWindow + sprite_get_width(ItemSheetSpr)/2, Pirate.yWindow+drawHeight + lineHeight + 60, string_hash_to_newline(itemPowerDescription), 12, sprite_get_width(ItemSheetSpr) - 30)
    }

/* */
}
/*  */
