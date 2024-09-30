/// @description Do Actions

if instance_exists(CombatRunner)
    {
    if !CombatRunner.playerTurn or __view_get( e__VW.XView, 0 ) != 0
        visible = false
    else
        visible = true
        
    if waitLeft > 0
        canUse = false
    else
        canUse = true
    
    if point_in_rectangle(window_view_mouse_get_x(0), window_view_mouse_get_y(0), x - sprite_width/2, y - sprite_height/2, x + sprite_width/2, y + sprite_height/2) and mouse_check_button_pressed(mb_left) and CombatRunner.playerTurn
        {
        if canUse
            {
            if !selected 
                {
                with ActionParent
                    {
                    selected = false
                    myTarget = noone
                    }
                CombatRunner.canEndTurn = false
                selected = true
                if !needsTarget
                    CombatRunner.canEndTurn = true
                }
            else
                {
                selected = false
                myTarget = noone
                CombatRunner.canEndTurn = false
                }
            }
        }
    if selected and needsTarget// and myTarget == noone
        {
        with Enemy
            if mouse_check_button_pressed(mb_left)
                {
                targeted = false
                if point_in_rectangle(window_view_mouse_get_x(0), window_view_mouse_get_y(0), x-sprite_width/2, y-sprite_height/2, x+sprite_height/2, y+sprite_height/2)
                    {
                    other.myTarget = id
                    CombatRunner.canEndTurn = true
                    }
                }
        }
    }

