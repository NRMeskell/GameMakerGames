var __b__;
__b__ = action_if_variable(instance_exists(Defeat), false, 0);
if __b__
{
///Draw info

if drawInfo and __view_get( e__VW.XView, 0 ) = 0
    {
    if myType = "melee"
        drawInfoY = y+sprite_height/2 + sprite_get_height(ActionInfoSpr)/2 + infoYGap
    if myType = "ranged"
        drawInfoY = y+sprite_height/2 + sprite_get_height(ActionInfoSpr)/2 + infoYGap
    if myType = "cannon"
        drawInfoY = y-sprite_height/2 - sprite_get_height(ActionInfoSpr)/2 - infoYGap
    if myType = "ship"
        drawInfoY = y-sprite_height/2 - sprite_get_height(ActionInfoSpr)/2 - infoYGap
    
    DrawActionInfo(object_index, startX, drawInfoY, false, "pirate", priority) 
    
    /*
    if myType = "melee"
        {
        drawInfoY = y+sprite_height/2 + sprite_get_height(ActionInfoSpr)/2 + infoYGap
        draw_sprite(ActionInfoSpr, 0, startX, drawInfoY)
        }
    if myType = "ranged"
        {
        drawInfoY = y+sprite_height/2 + sprite_get_height(ActionInfoSpr)/2 + infoYGap
        draw_sprite(ActionInfoSpr, 1, startX, drawInfoY)
        }
    if myType = "cannon"
        {
        drawInfoY = y-sprite_height/2 - sprite_get_height(ActionInfoSpr)/2 - infoYGap
        draw_sprite(ActionInfoSpr, 2, startX, drawInfoY)
        }
    if myType = "ship"
        {
        drawInfoY = y-sprite_height/2 - sprite_get_height(ActionInfoSpr)/2 - infoYGap
        draw_sprite(ActionInfoSpr, 3, startX, drawInfoY)
        }
    draw_set_color(c_black) 
    draw_set_valign(fa_top)   
    draw_set_halign(fa_right)
    draw_text(startX + timerX, drawInfoY - nameY, rechargeTime)
    
    draw_set_halign(fa_left)
    draw_text(startX + shiftX, drawInfoY - nameY, name)
    draw_text_ext(startX + shiftX, drawInfoY - descY, description, 11, drawWidth)
    */
    }
    
arrowHeight = cos(arrowHeightTimer) * 3
arrowHeightTimer += 0.03
    
if needsTarget and selected
    {
    if myTarget != noone
        {
        with Enemy
            if id == other.myTarget
                draw_sprite(TargetedSpr, 0, x, y + sprite_get_height(EnemyFrameSpr)/2 + 6 + other.arrowHeight)
        }
    else
        {
        with Enemy
            draw_sprite(TargetedSpr, 1, x, y + sprite_get_height(EnemyFrameSpr)/2 + 6 + other.arrowHeight)
        }
    }

/* */
}
/*  */
