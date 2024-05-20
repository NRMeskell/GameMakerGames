var __b__;
__b__ = action_if_variable(instance_exists(Defeat), false, 0);
if __b__
{
{
///Draw Stuff

if alarm[1] == -1
    {
    draw_self()
    draw_set_halign(fa_right)
    draw_set_valign(fa_center)
    draw_set_color(c_black)
    draw_text_transformed(x - 30, y+1, string_hash_to_newline(name), 1.3, 1.3, 0)
    
    healthBarWidth = 332
    healthDiffWidth = (1-(healthDiff/maxHealth))*healthBarWidth
    myHealthWidth = (1-(myHealth/maxHealth))*healthBarWidth
    //Draw Health
    draw_set_color(make_colour_rgb(151, 122, 2))
    draw_rectangle(x-21-healthDiffWidth,(y-19)+33,x-21-myHealthWidth,(y-18)+33,false)
    draw_set_color(merge_color(c_black,c_red,0.7))
    draw_rectangle(x-21-healthBarWidth,(y-19)+33,x-21-myHealthWidth,(y-18)+33,false)
    draw_set_color(merge_color(c_black,c_red,0.6))
    draw_rectangle(x-21- healthBarWidth,(y-19)+33,x-21-myHealthWidth,(y-19)+33,false)
    }

///Draw End Turn Button

if playerTurn and __view_get( e__VW.XView, 0 ) = 0
    {
    showSkipButton = true
    with ActionParent
        if selected
            other.showSkipButton = false     
    
    if (canEndTurn or showSkipButton){
        if overEndTurnButton
            draw_sprite_ext(EndTurnSpr, !canEndTurn, startX, startY-yGap,1,1,0,c_ltgray,1)
        else
            draw_sprite_ext(EndTurnSpr, !canEndTurn, startX, startY-yGap,1,1,0,c_white,1)
        }
    }

}
}
