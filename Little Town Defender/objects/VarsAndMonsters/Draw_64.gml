/// @description Draw Victory

if global.Victory = true
    {
    with Enemy
        instance_destroy()
    global.Gold = 0
    global.Trees = 0
    global.Rocks = 0
    
    if global.BribedDone = true
        draw_background(BribeBck, 0, 0)
        
    if global.Summoned = true
        draw_background(SummonBck, 0, 0)
        
    if global.Army = true
        draw_background(ArmyBck, 0, 0)
        
    draw_set_font(GameOverFont)
    draw_set_halign(fa_center)
    draw_set_valign(fa_center)
    draw_text(room_width/2, room_height/2, string_hash_to_newline("Victory!"))
    }

///Draw Gold, Resources and other

if TownHall.visible = true
{

VariablePlacement = 108

Down = 11

draw_sprite_ext(GUIMenuSpr, 1, 6 + sprite_get_width(GUIMenuSpr), 5, 1, 1, 0, c_white, 1)

draw_set_font(DisplayResourceFont)
draw_set_color(c_yellow)
draw_set_halign(fa_left)
draw_set_valign(fa_center)

draw_text(__view_get( e__VW.XView, 0 ) + VariablePlacement + 8, __view_get( e__VW.YView, 0 ) + 10 + Down, string_hash_to_newline(global.Gold))

draw_set_color(c_black)
draw_text(__view_get( e__VW.XView, 0 ) + VariablePlacement + 8, __view_get( e__VW.YView, 0 ) + 25 + Down, string_hash_to_newline(global.Trees))
draw_text(__view_get( e__VW.XView, 0 ) + VariablePlacement + 8, __view_get( e__VW.YView, 0 ) + 40 + Down, string_hash_to_newline(global.Rocks))

draw_sprite(ResourcesSpr, 0, __view_get( e__VW.XView, 0 ) + VariablePlacement + 2, __view_get( e__VW.YView, 0 ) + 10 + Down)
draw_sprite(ResourcesSpr, 1, __view_get( e__VW.XView, 0 ) + VariablePlacement + 2, __view_get( e__VW.YView, 0 ) + 25 + Down)
draw_sprite(ResourcesSpr, 2, __view_get( e__VW.XView, 0 ) + VariablePlacement + 2, __view_get( e__VW.YView, 0 ) + 40 + Down)

}

