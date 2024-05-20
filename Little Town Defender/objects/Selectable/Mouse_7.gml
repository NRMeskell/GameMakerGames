/// @description Select

//Select Heros and Workers

if TownHall.visible = true
if MyThing.object_index = Worker or MyThing.object_index = Warrior or MyThing.object_index = Archer or MyThing.object_index = Wizard or MyThing.object_index = Healer 
if ObjectPlacer.ObjectPlace == "None"  //No Object Selected to place
if point_distance(mouse_x, mouse_y, global.GrabStartX, global.GrabStartY) < 3
{   
if distance_to_point(mouse_x, mouse_y) < 1  //If close to mouse
if global.BeenSelected = false
    {              
    MyThing.Selected = true
    global.BeenSelected = true
    JustSelected = true //This is for selection menu: click on selection menu
            

    exit
    }
}

//Select Buildings

if ObjectPlacer.ObjectPlace == "None"  //No Object Selected to place
{   
if distance_to_point(mouse_x, mouse_y) < 1  //If close to mouse
if global.BeenSelected = false
if point_distance(mouse_x, mouse_y, global.GrabStartX, global.GrabStartY) < 3
    {              
    MyThing.Selected = true
    global.BeenSelected = true
    JustSelected = true //This is for selection menu: click on selection menu
    }
}

