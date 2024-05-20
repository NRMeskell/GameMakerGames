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
    with Enemy
        Fire = false
    
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
            
    with Magic
        if MyTower = other.id
            instance_destroy()
                    
    with instance_nearest(x,y,Selectable)
        instance_destroy()
            
    instance_destroy()
    }

///Fire

if instance_exists(Enemy)
if TownHall.visible = true
{
Target = instance_nearest(x,y,Enemy)

if alarm[1] <= 1 and distance_to_object(Target) < Range and Created == true
    {
    if ManyArrow == false
    with instance_create(x,y - 5,Magic)
        {
        //Fire
        if other.Target.sprite_index == DragonBody
            direction = point_direction(x,y,other.Target.x,other.Target.y + other.Target.sprite_height/2)
        else
            direction = point_direction(x,y,other.Target.x,other.Target.y - other.Target.sprite_height/4)
        
        image_angle = direction
        motion_set(direction,other.FireSpeed)
        alarm[2] = other.Range/other.FireSpeed + 5
        MyFire = other
        
        //Arrow Specialities
        Damage = other.Damage + other.Damage * global.BloodBonus
        Health = 1
        Fire = other.Fire
        Light = other.Light
        FireTime = other.FireTime
        Explode = other.Explode
        Burn = other.Burn
        LightDirection = other.LightDirection
        LightRange = other.LightRange
        Stun = other.Stun
        
        MyTower = other.id
        }
        
    MySound = audio_play_sound(MagicSnd, 0, false)
    alarm[1] = FireRate
    }
}

///Click on Buttons

if Selected == 1
if mouse_check_button_pressed(mb_left)
{
//Upgrade to Fire
if point_in_rectangle(mouse_x, mouse_y, ButtonLeft1, ButtonTop1, ButtonRight1, ButtonBottom1) //Top
if global.Gold >= global.FireCost
if global.Trees >= global.FireWood
if global.Rocks >= global.FireStone
if image_index = 0    
    {
    global.Gold -= global.FireCost
    global.Trees -= global.FireWood
    global.Rocks -= global.FireStone
    
    SellCost = global.FireCost div 2
    SellWood = global.FireWood div 2
    SellStone = global.FireStone div 2
    
    //Upgrades
    image_index = 1
    Health = 20
    MaxHealth = Health
    Damage = 2
    Fire = true
    
    //Needs to be built
    Created = false
    Build = 100
    BuildSpeed = global.Upgrade1Build
    Placex = 0
    BuildTop = 0
    if !place_meeting(x,y,Building)
        instance_create(x,y,Building)
    exit
    }
    
//Upgrade to Lightning
if point_in_rectangle(mouse_x, mouse_y, ButtonLeft1, ButtonTop2, ButtonRight1, ButtonBottom2) //Top
if global.Gold >= global.LightningCost
if global.Trees >= global.LightningWood
if global.Rocks >= global.LightningStone
if image_index = 0    
    {
    global.Gold -= global.LightningCost
    global.Trees -= global.LightningWood
    global.Rocks -= global.LightningStone
    
    SellCost = global.LightningCost div 2
    SellWood = global.LightningWood div 2
    SellStone = global.LightningStone div 2
    
    //Upgrades
    image_index = 4
    Health = 20
    MaxHealth = Health
    Damage = 2
    Light = true
    
    //Needs to be built
    Created = false
    Build = 100
    BuildSpeed = global.Upgrade1Build
    Placex = 0
    BuildTop = 0
    Damage = 2
    if !place_meeting(x,y,Building)
        instance_create(x,y,Building)
    exit
    }
    
//Upgrade to Bomb
if point_in_rectangle(mouse_x, mouse_y, ButtonLeft1, ButtonTop1, ButtonRight1, ButtonBottom1) //Top
if global.Gold >= global.BombCost
if global.Trees >= global.BombWood
if global.Rocks >= global.BombStone
if image_index = 1   
    {
    global.Gold -= global.BombCost
    global.Trees -= global.BombWood
    global.Rocks -= global.BombStone
    
    SellCost = global.BombCost div 2
    SellWood = global.BombWood div 2
    SellStone = global.BombStone div 2
    
    //Upgrades
    image_index = 2
    Health = 40
    MaxHealth = Health
    Explode = true
    Damage = 4
    
    //Needs to be built
    Created = false
    Build = 100
    BuildSpeed = global.Upgrade2Build
    Placex = 0
    BuildTop = 0
    if !place_meeting(x,y,Building)
        instance_create(x,y,Building)
    exit
    }

//Upgrade to Ember
if point_in_rectangle(mouse_x, mouse_y, ButtonLeft1, ButtonTop2, ButtonRight1, ButtonBottom2) //Top
if global.Gold >= global.EmberCost
if global.Trees >= global.EmberWood
if global.Rocks >= global.EmberStone
if image_index = 1   
    {
    global.Gold -= global.EmberCost
    global.Trees -= global.EmberWood
    global.Rocks -= global.EmberStone
    
    SellCost = global.EmberCost div 2
    SellWood = global.EmberWood div 2
    SellStone = global.EmberStone div 2
    
    //Upgrades
    image_index = 3
    Health = 40
    MaxHealth = Health
    Burn = 2
    Melt = true
    Damage = 6
    
    //Needs to be built
    Created = false
    Build = 100
    BuildSpeed = global.Upgrade2Build
    Placex = 0
    BuildTop = 0
    if !place_meeting(x,y,Building)
        instance_create(x,y,Building)
    exit
    }
    
//Upgrade to Charged
if point_in_rectangle(mouse_x, mouse_y, ButtonLeft1, ButtonTop1, ButtonRight1, ButtonBottom1) //Top
if global.Gold >= global.ShockCost
if global.Trees >= global.ShockWood
if global.Rocks >= global.ShockStone
if image_index = 4   
    {
    global.Gold -= global.ShockCost
    global.Trees -= global.ShockWood
    global.Rocks -= global.ShockStone
    
    SellCost = global.ShockCost div 2
    SellWood = global.ShockWood div 2
    SellStone = global.ShockStone div 2
    
    //Upgrades
    image_index = 5
    Health = 40
    MaxHealth = Health
    FireRate = 200
    Damage = 8
    
    //Needs to be built
    Created = false
    Build = 100
    BuildSpeed = global.Upgrade2Build
    Placex = 0
    BuildTop = 0
    if !place_meeting(x,y,Building)
        instance_create(x,y,Building)
    exit
    }
    
//Upgrade to Chain
if point_in_rectangle(mouse_x, mouse_y, ButtonLeft1, ButtonTop2, ButtonRight1, ButtonBottom2) //Top
if global.Gold >= global.ChainCost
if global.Trees >= global.ChainWood
if global.Rocks >= global.ChainStone
if image_index = 4   
    {
    global.Gold -= global.ChainCost
    global.Trees -= global.ChainWood
    global.Rocks -= global.ChainStone
    
    SellCost = global.ChainCost div 2
    SellWood = global.ChainWood div 2
    SellStone = global.ChainStone div 2
    
    //Upgrades
    image_index = 6
    Health = 40
    MaxHealth = Health
    LightRange = 200
    LightDirection = 90
    FireRate = 100
    Damage = 4
    
    
    //Needs to be built
    Created = false
    Build = 100
    BuildSpeed = global.Upgrade2Build
    Placex = 0
    BuildTop = 0
    if !place_meeting(x,y,Building)
        instance_create(x,y,Building)
    exit
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
