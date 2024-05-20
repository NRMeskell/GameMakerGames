var __b__;
__b__ = action_if_variable(instance_exists(Defeat), false, 0);
if __b__
{
///Add Actions to action list

//Check to see if availible
//if myType = "melle" and CombatRunner.closeRange == false
  //  canUseActions = false
if myType = "cannon" and (HasStored(2,1) == false) //(CombatRunner.closeRange == true) or 
    canUseActions = false
if myType = "ship" and global.totalWheelBonus == 0
    canUseActions = false
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

if (canUseActions and point_in_rectangle(mouse_x, mouse_y, xMin, yMin, xMax, yMax) or actionSelected) and CombatRunner.playerTurn and !instance_exists(Event) and __view_get( e__VW.XView, 0 ) == 0
    {
    //Update List
    if refreshed = false
        {
        refreshed = true
        ds_list_clear(actionList)
        for(i=ds_list_size(CombatRunner.actionList)-1; i>=0; i--)
            {
            //if ds_map_find_value(CombatRunner.actionTypeMap, ds_list_find_value(CombatRunner.actionList, i).object_index) == myType
            if ds_list_find_value(CombatRunner.actionList, i).myType == myType
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
                canUse = other.canUseActions
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
