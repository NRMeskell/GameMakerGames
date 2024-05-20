var __b__;
__b__ = action_if_variable(instance_exists(Defeat), false, 0);
if __b__
{
///Draw Self
if __view_get( e__VW.XView, 0 ) = 0
{
drawInfo = false

animationNumber ++
siwtchInfoY = 180
infoYGap = 5
drawWidth = sprite_get_width(ActionInfoSpr) - 32
nameY = 29
descY = 10
shiftX = -4
timerX = sprite_get_width(ActionInfoSpr) - 40
startX = 256+40
drawColor = c_white
if point_in_rectangle(mouse_x, mouse_y, x - sprite_width/2, y - sprite_height/2, x + sprite_width/2, y + sprite_height/2)
    {
    drawColor = c_ltgray
    event_user(2)
    draw_sprite_ext(PlayerAttackFrameSpr, 0, x,y, 1, 1, 0, c_ltgray, 1)
    draw_sprite_ext(PlayerAttackActionsSpr, spriteNumber, x, y, 1, 1, 0, c_ltgray, 1)
    ///Draw info
    if !place_meeting(x,y,PlayerActionRunner)
        {
        drawInfo = true
        }
    }
else
    {
    if canUse
        {
        drawColor = c_white
        draw_sprite_ext(PlayerAttackFrameSpr, 0, x, y, 1, 1,0, c_white, 1)
        draw_sprite_ext(PlayerAttackActionsSpr, spriteNumber, x, y, 1, 1, 0, c_white, 1)
        }
    else
        {
        drawColor = c_gray
        draw_sprite_ext(PlayerAttackFrameSpr, 0, x,y, 1, 1, 0, c_gray, 1)
        draw_sprite_ext(PlayerAttackActionsSpr, spriteNumber, x, y, 1, 1, 0, c_gray, 1)
        }
    }

if selected
    {
    if myType == "melle"
        draw_sprite(MelleSelectedSpr, animationNumber div 20, x, y)
    if myType == "ranged"
        draw_sprite(RangedSelectedSpr, animationNumber div 20, x, y)
    if myType == "cannon"
        draw_sprite(CannonSelectedSpr, animationNumber div 20, x, y)
    if myType == "ship"
        draw_sprite(ShipSelectedSpr, animationNumber div 20, x, y)
    //drawInfo = true
    }
    
if waitLeft > 0
    {
    draw_set_alpha(0.7)
    draw_set_color(merge_color(c_gray, c_dkgray, 0.75))
    draw_rectangle(x-sprite_width/2+5, (y-sprite_height/2+4), x+sprite_width/2-5, (y+sprite_height/2-5)-((waitLeft/rechargeTime)*(sprite_height-10)), false)
    draw_set_color(c_dkgray)
    draw_rectangle(x-sprite_width/2+5, (y+sprite_height/2-5)-((waitLeft/rechargeTime)*(sprite_height-10)), x+sprite_width/2-5, y+sprite_height/2-5, false)
    draw_set_alpha(1)
    //draw_sprite(PlayerActionTimerSpr,0,x,y)
    mergeColorLevel = 0.4
    if myType == "melle"
        draw_set_color(merge_color(merge_color(make_color_rgb(128, 128, 128), drawColor, mergeColorLevel), c_black, 0.2))
    if myType == "ranged"
        draw_set_color(merge_color(merge_color(make_color_rgb(158, 126, 2), drawColor, mergeColorLevel), c_black, 0.2))
    if myType == "cannon"
        draw_set_color(merge_color(merge_color(make_color_rgb(180, 0, 0), drawColor, mergeColorLevel), c_black, 0.2))
    if myType == "ship"
        draw_set_color(merge_color(merge_color(make_color_rgb(0, 73, 165), drawColor, mergeColorLevel), c_black, 0.2))

    draw_set_font(global.LargePirateFont)
    draw_set_halign(fa_center)
    draw_set_valign(fa_center)
    draw_text(x + 1, y, string_hash_to_newline(waitLeft))
    }
}

}
