/// @description Select Worker

var inst;
if global.Selectings = true
if TownHall.visible = true
{
with Worker
    if point_in_rectangle(x,y - sprite_height/2,global.GrabStartX, global.GrabStartY, mouse_x, mouse_y) or point_in_rectangle(x,y - sprite_height/2, mouse_x, mouse_y, global.GrabStartX, global.GrabStartY) or point_in_rectangle(x,y - sprite_height/2, global.GrabStartX, mouse_y, mouse_x, global.GrabStartY) or point_in_rectangle(x,y - sprite_height/2, mouse_x, global.GrabStartY, global.GrabStartX, mouse_y) 
        {      
        with MyThing
            {   
            MyThing.Selected = true
            global.BeenSelected = true
            JustSelected = true //This is for selection menu: click on selection menu
            }
        }
}

///Release

global.Selectings = false

