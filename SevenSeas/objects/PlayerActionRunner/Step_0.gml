var __b__;
__b__ = action_if_variable(instance_exists(Defeat), false, 0);
if __b__
{
///Add Actions to action list

//Check to see if availible
if CombatRunner.alarm[1] > 0
	canUseActions = false

if !CombatRunner.playerTurn or CombatRunner.alarm[1] > 0
    visible = false
else
    visible = true

actionSelected = false
with ActionParent
    if selected == true and y = other.y
        other.actionSelected = true

scrollSpeed = 8

if (point_in_rectangle(window_view_mouse_get_x(0), window_view_mouse_get_y(0), xMin, yMin, xMax, yMax) or actionSelected) and CombatRunner.playerTurn and !instance_exists(Event) and __view_get( e__VW.XView, 0 ) == 0
    {
    //Update List
    if refreshed = false
        {
        refreshed = true
        ds_list_clear(actionList)
        for(i=ds_list_size(CombatRunner.actionList)-1; i>=0; i--)
            {
            //if ds_map_find_value(CombatRunner.actionTypeMap, ds_list_find_value(CombatRunner.actionList, i).object_index) == myType
            if ds_list_find_value(CombatRunner.actionList, i).actionType == actionType
                ds_list_add(actionList, ds_list_find_value(CombatRunner.actionList, i))
            }
        }
        
    //scroll
    if place_meeting(x,y,ActionParent)
        {
        with ActionParent
            if y == other.y
                x += other.scrollSpeed
        xMax += scrollSpeed
        }
    else
        {
        nextAction = -1
        for(i=0; i<ds_list_size(actionList); i++)
            if !collision_line(x-20,y,1000,y,ds_list_find_value(actionList, i),false,true)
                {
                nextAction = ds_list_find_value(actionList, i)
                }
                
        if nextAction != -1
            with nextAction
                {
                x = other.x
                y = other.y
				event_user(3)
                }
        }
    }
else
    {
    with ActionParent
        if y == other.y
            {
            x -= other.scrollSpeed
            if x < other.x
                {
                x = -100
                y = -100
                }
            }
    if xMax > x + sprite_width/2
        xMax -= scrollSpeed
    refreshed = false
    }
}
