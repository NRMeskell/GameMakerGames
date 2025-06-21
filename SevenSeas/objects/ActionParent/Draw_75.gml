var __b__;
__b__ = action_if_variable(instance_exists(Defeat), false, 0);
if __b__
{
///Draw info

if drawInfo and __view_get( e__VW.XView, 0 ) = 0
    {
    if actionType = "melee"
        drawInfoY = y+sprite_height/2 + sprite_get_height(ActionInfoSpr)/2 + infoYGap
    if actionType = "ranged"
        drawInfoY = y+sprite_height/2 + sprite_get_height(ActionInfoSpr)/2 + infoYGap
    if actionType = "cannon"
        drawInfoY = y-sprite_height/2 - sprite_get_height(ActionInfoSpr)/2 - infoYGap
    if actionType = "ship"
        drawInfoY = y-sprite_height/2 - sprite_get_height(ActionInfoSpr)/2 - infoYGap
    
    DrawActionInfo(object_index, startX, drawInfoY, false, "pirate", priority, requireText == "") 
    
	if requireText != ""{
		draw_set_halign(fa_center)
		draw_set_valign(fa_center)
		if canUse == false
			draw_set_color(merge_color(c_red, c_black, 0.12))
		else
			draw_set_color(merge_color(c_yellow, c_black, 0.45))
		draw_text(startX+141, drawInfoY+44, requireText)
	}
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
