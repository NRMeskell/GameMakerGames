/// @description Collision With Worker and Building

//Collide
if place_meeting(x,y,Worker)
{
MyWork = instance_nearest(x,y,Worker)
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
    if place_meeting(x, y, Worker)
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
        Placex = 0
        BuildTop = 0
        if !place_meeting(x,y,Building)
            instance_create(x,y,Building)
        }
    }
    
if Repair = true
    {
    if place_meeting(x, y, Worker)
    if !place_meeting(x,y,Enemy)
        {
        MyWork = instance_nearest(x,y,Worker)
        if MyWork.Task = "Building"
            {
            MyBuilder = instance_nearest(x,y,Worker)
            Health += BuildSpeed * MaxHealth / 100 * MyBuilder.Level
            with instance_nearest(x,y,Building)
                visible = false
            }
        }
    }
    
//Collide
if (Created = false and Build >= 100 and place_meeting(x,y,Worker))
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
   //Add Worker            
    MyWorker = instance_create(x,y-1,Worker)
    with MyWorker
        {
        MyHouse = other
        Level = other.Level
        }
        
    //Refresh Selectable so Worker can be selected
    with MySelector
        instance_destroy()  
        
    MySelector =  instance_create(x,y,Selectable)

    with MySelector
        {
        MyThing = other
        mask_index = MyThing.mask_index
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


///Destroyed

if Health < 1
    {
    with instance_create(x,y,Crumble)
        {
        sprite_index = other.sprite_index
        image_index = other.image_index
        image_alpha = other.image_alpha
        }
    
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
        
    if Created = true
        with MyWorker
            instance_destroy()
            
    instance_destroy()
    }

///Gold

if alarm[1] <= 0
if Created = true
{
global.Gold += 1
alarm[1] = FireRate
}

///Click on Buttons
    

if Selected = true
if mouse_check_button_pressed(mb_left)
    {
    ButtonLeft1 = __view_get( e__VW.WView, 0 ) - sprite_get_width(ButtonsSpr) * MenuSize - 15
    ButtonLeft2 = __view_get( e__VW.WView, 0 ) - 15 - sprite_get_width(ButtonsSpr)/2 * MenuSize + 5
    
    ButtonRight1 = __view_get( e__VW.WView, 0 ) - 15
    ButtonRight2 = __view_get( e__VW.WView, 0 ) - 15 - sprite_get_width(ButtonsSpr)/2 * MenuSize - 5
    
    ButtonTop1 = __view_get( e__VW.HView, 0 ) - Edge - sprite_get_height(MenuArea) * MenuSize * 3/5 - sprite_get_height(ButtonsSpr) * MenuSize/2
    ButtonBottom1 = __view_get( e__VW.HView, 0 ) - Edge - sprite_get_height(MenuArea) * MenuSize * 3/5 + sprite_get_height(ButtonsSpr) * MenuSize/2 
    
    ButtonTop2 = __view_get( e__VW.HView, 0 ) - Edge - sprite_get_height(MenuArea) * MenuSize * 2/5 - sprite_get_height(ButtonsSpr) * MenuSize/2
    ButtonBottom2 = __view_get( e__VW.HView, 0 ) - Edge - sprite_get_height(MenuArea) * MenuSize * 2/5 + sprite_get_height(ButtonsSpr) * MenuSize/2 
    
    ButtonTop3 = __view_get( e__VW.HView, 0 ) - Edge - sprite_get_height(MenuArea) * MenuSize * 1/5 - sprite_get_height(ButtonsSpr) * MenuSize/2
    ButtonBottom3 = __view_get( e__VW.HView, 0 ) - Edge - sprite_get_height(MenuArea) * MenuSize * 1/5 + sprite_get_height(ButtonsSpr) * MenuSize/2 
    /*
    if point_in_rectangle(mouse_x, mouse_y, ButtonLeft1, ButtonTop2, ButtonRight1, ButtonBottom2) //Top
    if Level < 2
    if global.Gold >= global.BetterWorkerCost
    if global.Trees >= global.BetterWorkerWood
    if global.Rocks >= global.BetterWorkerStone   
        {
        global.Gold -= global.BetterWorkerCost
        global.Trees -= global.BetterWorkerWood
        global.Rocks -= global.BetterWorkerStone
        
        SellCost += global.BetterWorkerCost div 2
        SellWood += global.BetterWorkerWood div 2
        SellStone += global.BetterWorkerStone div 2
        
        //Upgrades
        Health = 20
        MaxHealth = Health
        Level += 0.5
        
        if image_index = 3
            image_index = 4
    
        if image_index = 1
            image_index = 3
        
        for(i=0; i < instance_number(Worker); i ++)
            {
            ThisWorker = instance_find(Worker,i)
            
            if ThisWorker.MyHouse = id
                ThisWorker.Level += 0.5
            }
        }*/
    
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
/*  */
