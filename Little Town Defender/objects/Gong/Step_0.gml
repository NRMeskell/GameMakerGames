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
        BuildSpeed = 0.1
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
            
    instance_destroy()
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
    
    if Created = true
    if !instance_exists(Dragon)
    if point_in_rectangle(mouse_x, mouse_y, ButtonLeft1, ButtonTop2, ButtonRight1, ButtonBottom2) //Top
    if global.Gold >= RingCost
    if global.Trees >= RingWood
    if global.Rocks >= RingStone
        {   
        global.Gold -= RingCost
        global.Trees -= RingWood
        global.Rocks -= RingStone
        
        global.Summoned = true
        
        Monster = Dragon
        
        global.Summoned = true
             
        audio_play_sound(GongSnd, 1, false)
        audio_play_sound(DragonMusic, 1, true)
        
        audio_stop_sound(GameMusic1)
        audio_stop_sound(GameMusic2)
        audio_stop_sound(GameMusic3)
        audio_stop_sound(MenuMusic)
        with MonsterInfo
            instance_destroy()
            
        VarsAndMonsters.alarm[0] = -1
        
        Direction = choose(1,2,3,4)

        if Direction = 1
            {
            Height = random_range(288, room_height)
            instance_create(-32, Height, Monster)
            }
            
        if Direction = 2 or Direction = 3
            {
            Width = random_range(200, room_width-200)
            instance_create(Width, room_height + 32, Monster)
            }
            
        if Direction = 4
            {
            Height = random_range(288, room_height)
            instance_create(room_width + 32, Height, Monster)
            }
        }
    
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