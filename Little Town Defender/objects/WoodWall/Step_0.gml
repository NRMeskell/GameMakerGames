/// @description Collision With Worker and Building

MyWork = instance_nearest(x,y,Worker)

if instance_exists(Enemy)
    MyMonster = instance_nearest(x,y,Enemy)
else
    MyMonster = instance_furthest(x,y,Mine)

//Collide
if point_distance(x, y, MyWork.x, MyWork.y) < 3
{
if MyWork.Task = "Building"
    {
    if Build = 100 and Created = false
        {
        alarm[0] = 1
        Build = 1
        //with instance_nearest(x,y,Building)
            //visible = false
        }
    }
}
    
//Build
if Build < 100
    {
    if point_distance(x, y, MyWork.x, MyWork.y) < 3 and !place_meeting(x,y,Enemy)
        {
        MyBuilder = instance_nearest(x,y,Worker)
        Build += BuildSpeed * MyBuilder.Level
        with instance_nearest(x,y,Building)
            visible = false
        }
    else
        {
        //Needs to be built
        Created = false
        Build = 100
        BuildSpeed = 0.25
        Placex = 0
        BuildTop = 0
        if !place_meeting(x,y,Building)
            instance_create(x,y,Building)
        }
    }
    
if Repair = true
    {
    if point_distance(x, y, MyWork.x, MyWork.y) < 3 and point_distance(MyMonster.x, MyMonster.y, x, y) > 5
        {
        MyWork = instance_nearest(x,y,Worker)
        if MyWork.Task = "Building"
            {
            MyBuilder = instance_nearest(x,y,Worker)
            Health += BuildSpeed * MyBuilder.Level
            with instance_nearest(x,y,Building)
                visible = false
            }
        }
    }
    
//Collide
if (Created = false and Build >= 100 and point_distance(x, y, MyWork.x, MyWork.y) < 3)
{
MyWork = instance_nearest(x,y,Worker)
if MyWork.Task = "Building"
    {
    Repair = false
    Created = true
    with instance_nearest(x,y,Building)
            {
            with Worker
                {
                if Target = other.id
                    Target = MyHouse
                }
            instance_destroy()
            }
    }
}
    
if (Repair = true and Health >= MaxHealth)
{
Repair = false
Health = MaxHealth
with instance_nearest(x,y,Building)
        {
        with Worker
            {
            if Target = other.id
                Target = MyHouse
            }
        instance_destroy()
        }    
}


///Not a Wall until built

if Created = true
    mask_index = sprite_index
else
    mask_index = SelectedSpr
    
if MyNoWallPlace.image_index != image_index
    with MyNoWallPlace
        image_index = other.image_index

///Click on Buttons

if Selected == 1
if mouse_check_button_pressed(mb_left)
{    
if point_in_rectangle(mouse_x, mouse_y, ButtonLeft1, ButtonTop3, ButtonRight1, ButtonBottom3) //Top
    {
    global.Gold += SellCost * Health div MaxHealth
    global.Trees += SellWood * Health div MaxHealth
    global.Rocks += SellStone * Health div MaxHealth
    
    Health = -1
    }
    
/*if point_in_rectangle(mouse_x, mouse_y, ButtonLeft2, ButtonTop3, ButtonRight1, ButtonBottom3) //Top
if global.Gold >= RepairCost
if global.Trees >= RepairWood
if global.Rocks >= RepairStone
    {
    global.Gold -= RepairCost
    global.Trees -= RepairWood
    global.Rocks -= RepairStone

    Repair = true
    instance_create(x,y,Building)
    }*/
}

/* */
///Looks Damaged

DamageLevel = Health / MaxHealth

sprite_index = WoodWallSpr

if DamageLevel < 0.66
    {
    sprite_index = WoodDam1
    }
    
if DamageLevel < 0.33
    {
    sprite_index = WoodDam2
    }

/* */
///Destroyed

if Health < 1
    {
    sprite_index = WoodDam2
    
    with instance_create(x,y,Crumble)
        {
        sprite_index = other.sprite_index
        image_index = other.image_index
        image_alpha = other.image_alpha
        }
    
    with MyNoWallPlace
        instance_destroy()
    
    if Created = false or Repair = true
        with instance_nearest(x,y,Building)
            {
            with Worker
                if Target = other.id
                    Target = MyHouse
            instance_destroy()
            }
    
    with instance_nearest(x,y,Selectable)
        instance_destroy()
            
    instance_destroy()
    }

/* */
/*  */
