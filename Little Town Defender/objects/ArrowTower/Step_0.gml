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


///Fire

if TownHall.visible = true
if instance_exists(Enemy)
{
if Snipe == false
    Target = instance_nearest(x,y,Enemy)
else
    Target = instance_nearest(x,y,Enemy)
    
if alarm[1] <= 1 and distance_to_object(Target) < Range and Created == true
    {
    if ManyArrow == false
    with instance_create(x,y - 15,Arrow)
        {
        //Fire
        if other.Target.sprite_index == DragonBody
            direction = point_direction(x,y,other.Target.x,other.Target.y + 15)
        else
            direction = point_direction(x,y,other.Target.x,other.Target.y - other.Target.sprite_height/4)
            
        image_angle = direction
        motion_set(direction,other.FireSpeed)
        if other.Pierce = false
            alarm[2] = other.Range/other.FireSpeed + 5
        
        //Arrow Specialities
        Damage = other.Damage + other.Damage * global.BloodBonus
        Health = 1
        Stun = other.Stun
        Pierce = other.Pierce
        
        MyTower = other.id
        }
        
    if ManyArrow == true
        {
        for(r = -16; r < 24; r += 8)
            {
            with instance_create(x,y - 15,Arrow)
                {
                //Fire
                if other.Target.sprite_index == DragonBody
                    direction = point_direction(x,y,other.Target.x,other.Target.y + 15)
                else
                    direction = point_direction(x,y,other.Target.x,other.Target.y - other.Target.sprite_height/4)
                   
                direction += other.r
                image_angle = direction
                motion_set(direction,other.FireSpeed)
                alarm[2] = other.Range/other.FireSpeed + 5
                
                //Arrow Specialities
                Damage = other.Damage + other.Damage * global.BloodBonus
                Health = 1
                Stun = other.Stun
                Pierce = other.Pierce
                
                MyTower = other.id
                }
            }
        }
        
    MySound = audio_play_sound(ArrowSnd, 0, false)
    alarm[1] = FireRate
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
                    {
                    Target = MyHouse
                    JustSelected = false
                    global.BeenSelected = false
                    }
            instance_destroy()
            }
    
    with instance_nearest(x,y,Selectable)
        instance_destroy()
            
    with Arrow
        if MyTower = other.id
            instance_destroy()    
    
    instance_destroy()
    }

///Click on Buttons

if Selected == 1
if mouse_check_button_pressed(mb_left)
{
//Upgrade to Heavy
if point_in_rectangle(mouse_x, mouse_y, ButtonLeft1, ButtonTop1, ButtonRight1, ButtonBottom1) //Top
if global.Gold >= global.StrongCost
if global.Trees >= global.StrongWood
if global.Rocks >= global.StrongStone
if image_index = 0    
    {
    global.Gold -= global.StrongCost
    global.Trees -= global.StrongWood
    global.Rocks -= global.StrongStone
    
    SellCost = global.StrongCost div 2
    SellWood = global.StrongWood div 2
    SellStone = global.StrongStone div 2
    
    //Upgrades
    image_index = 1
    Health = 20
    MaxHealth = Health
    FireRate = 160
    Damage = 3
    
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
    
//Upgrade to Backline
if point_in_rectangle(mouse_x, mouse_y, ButtonLeft1, ButtonTop2, ButtonRight1, ButtonBottom2) //Top
if global.Gold >= global.SniperCost
if global.Trees >= global.SniperWood
if global.Rocks >= global.SniperStone
if image_index = 0    
    {
    global.Gold -= global.SniperCost
    global.Trees -= global.SniperWood
    global.Rocks -= global.SniperStone
    
    SellCost = global.SniperCost div 2
    SellWood = global.SniperWood div 2
    SellStone = global.SniperStone div 2
    
    //Upgrades
    image_index = 4
    Health = 20
    MaxHealth = Health
    Range = 300
    Damage = 2
    
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
    
//Upgrade to Rapid Fire
if point_in_rectangle(mouse_x, mouse_y, ButtonLeft1, ButtonTop1, ButtonRight1, ButtonBottom1) //Top
if global.Gold >= global.HeavyCost
if global.Trees >= global.HeavyWood
if global.Rocks >= global.HeavyStone
if image_index = 1   
    {
    global.Gold -= global.HeavyCost
    global.Trees -= global.HeavyWood
    global.Rocks -= global.HeavyStone
    
    SellCost = global.HeavyCost div 2
    SellWood = global.HeavyWood div 2
    SellStone = global.HeavyStone div 2
    
    //Upgrades
    image_index = 2
    Health = 40
    MaxHealth = Health
    Damage = 4
    FireRate = 60
    
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

//Upgrade to Multi
if point_in_rectangle(mouse_x, mouse_y, ButtonLeft1, ButtonTop2, ButtonRight1, ButtonBottom2) //Top
if global.Gold >= global.SprayCost
if global.Trees >= global.SprayWood
if global.Rocks >= global.SprayStone
if image_index = 1   
    {
    global.Gold -= global.SprayCost
    global.Trees -= global.SprayWood
    global.Rocks -= global.SprayStone
    
    SellCost = global.SprayCost div 2
    SellWood = global.SprayWood div 2
    SellStone = global.SprayStone div 2
    
    //Upgrades
    image_index = 3
    Health = 40
    MaxHealth = Health
    FireRate = 120
    Damage = 4
    ManyArrow = true
    
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
    
//Upgrade to Sniper
if point_in_rectangle(mouse_x, mouse_y, ButtonLeft1, ButtonTop1, ButtonRight1, ButtonBottom1) //Top
if global.Gold >= global.PierceCost
if global.Trees >= global.PierceWood
if global.Rocks >= global.PierceStone
if image_index = 4   
    {
    global.Gold -= global.PierceCost
    global.Trees -= global.PierceWood
    global.Rocks -= global.PierceStone
    
    SellCost = global.PierceCost div 2
    SellWood = global.PierceWood div 2
    SellStone = global.PierceStone div 2
    
    //Upgrades
    image_index = 5
    Health = 40
    MaxHealth = Health
    Damage = 2
    Pierce = true
    Range = 500
    
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
    
//Upgrade to Stun
if point_in_rectangle(mouse_x, mouse_y, ButtonLeft1, ButtonTop2, ButtonRight1, ButtonBottom2) //Top
if global.Gold >= global.PunchCost
if global.Trees >= global.PunchWood
if global.Rocks >= global.PunchStone
if image_index = 4   
    {
    global.Gold -= global.PunchCost
    global.Trees -= global.PunchWood
    global.Rocks -= global.PunchStone
    
    SellCost = global.PunchCost div 2
    SellWood = global.PunchWood div 2
    SellStone = global.PunchStone div 2
    
    //Upgrades
    image_index = 6
    Health = 40
    MaxHealth = Health
    FireRate = 120
    ManyArrow = false
    Stun = true
    Damage = 2
    
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
