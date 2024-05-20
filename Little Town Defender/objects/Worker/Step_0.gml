/// @description Worker Level Sprs

if HaveResource = "Tree" or HaveResource = "Rock" or HaveResource = "Gold"
    Target = MyHouse

if Level = 1
    {
    WalkingSpr = WorkerSpr
    WorkingSpr = WorkerWork
    TreeCarrySpr = WorkerTree
    RockCarrySpr = WorkerRock
    GoldCarrySpr = WorkerGold
    }
    
if Level = 1.5
    {
    WalkingSpr = WorkerSpr2
    WorkingSpr = WorkerWork2
    TreeCarrySpr = WorkerTree2
    RockCarrySpr = WorkerRock2
    GoldCarrySpr = WorkerGold2
    }
    
if Level = 2
    {
    WalkingSpr = WorkerSpr3
    WorkingSpr = WorkerWork3
    TreeCarrySpr = WorkerTree3
    RockCarrySpr = WorkerRock3
    GoldCarrySpr = WorkerGold3
    }

///Task is Buildings

if FoodReady = false
if Task == "Building"  //Check current task
{
Working = false  //Set defult to not working
if instance_exists(Building)
    {
    Target.Targeted = false
    Distance = distance_to_object(instance_furthest(x,y,Building)) //Set closest curent found distance to the furthest tree
    for(i = 0; i <= instance_number(Building); i ++)  //Go through all trees
        {
        with instance_find(Building,i) //Run with all trees
        if Targeted == false  //If not being cut down
            {
            if distance_to_object(other) <= other.Distance //If closer than closest found tree
                {
                with other  //Become workers tree Target
                    {
                    Target.Targeted = false
                    Distance = distance_to_object(instance_find(Building,i))
                    Target = instance_find(Building,i)
                    Working = true
                    }
                Targeted = true //Being cut down
                }                        
            }
        }
    }
}



///Task is Tree

if FoodReady = false
if Task == "Tree"  //Check current task
{
if HaveResource = "None"
if instance_exists(Tree)
if Target.sprite_index != TreeSpr or distance_to_object(Target) > Spd //Check not on Tree
    {
    Target.Targeted = false
    Working = false  //Set default to not working
    Target = instance_furthest(x,y,Tree)  //Check for furthest Tree
    Distance = distance_to_object(Target) //Set closest curent found distance to the furthest tree
    for(i = 0; i <= instance_number(Tree); i ++)  //Go through all trees
        {
        with instance_find(Tree,i) //Run with all trees
        if Targeted == false  //If not being cut down
            {
            if distance_to_object(other) <= other.Distance //If closer than closest found tree
                {
                with other  //Become workers tree Target
                    {
                    Target.Targeted = false
                    Distance = distance_to_object(instance_find(Tree,i))
                    Target = instance_find(Tree,i)
                    Working = true
                    }
            
                Targeted = true //Being cut down
                }                        
            }
        }
    }
}


///Task is Rock

if FoodReady = false
if Task == "Rock"  //Check current task
{
if HaveResource = "None"
{
if instance_exists(Mine)
if distance_to_object(Mine) > Spd //Check not on Tree
    {
    if instance_exists(Mine)  //Check tree exists
        {
        Target.Targeted = false
        Working = false  //Set defult to not working
        Target = instance_furthest(x,y,Mine)  //Check for furthest Tree
        Distance = distance_to_object(Target) //Set closest curent found distance to the furthest tree
        for(i = 0; i <= instance_number(Mine); i ++)  //Go through all trees
            {
            with instance_find(Mine,i) //Run with all trees
            if Targeted == false  //If not being cut down
                {
                if distance_to_object(other) <= other.Distance //If closer than closest found tree
                    {
                    with other  //Become workers tree Target
                        {
                        Target.Targeted = false
                        Distance = distance_to_object(instance_find(Mine,i))
                        Target = instance_find(Mine,i)
                        Working = true
                        }
                
                    if image_index != 0
                        Targeted = true //Being cut down
                    }                        
                }
            }
        }
    else
        Working = false //No Trees, go home
    }
}
else
    Working = false
}


///Task is Rock - Before Drops

/*


if Task == 'Rock'  //Check current task
{
if HaveResource = 'None'
    {
    if distance_to_object(Mine) > Spd //Check not on Tree
        {
        if instance_exists(Mine)  //Check tree exists
            {
            Working = true
            Target = Mine  //Check for furthest Tree                    
            }
        else
            Working = false //No Trees, go home
        }
    }
else
    Working = false
}


/* */
///Walk

//Depth
depth = -y - Spd - 1

if global.WorkerStage != 2 and global.WorkerStage != 4
if point_distance(Target.x, Target.y, x, y) > 1
    mp_potential_step(Target.x, Target.y, Spd, false)

//At Home
if global.WorkerStage < 1
if point_distance(x,y,MyHouse.x,MyHouse.y) < 1
    {
    sprite_index = WalkingSpr
    image_speed = 0
    image_index = 0
    if !(HaveResource == "None") //Drop Of Resource
        {
        if HaveResource = "Tree"
            global.Trees += 1
        if HaveResource = "Rock"
            global.Rocks += 1
        if HaveResource = "Gold"
            global.Gold += 100
        HaveResource = "None"
        }
    }
    
//Walking
if point_distance(x,y,Target.x,Target.y) > 1 //Not at house or Tree
    {
    //Holding Resource or Not
    if HaveResource = "None"
        sprite_index = WalkingSpr
    if HaveResource = "Tree"
        sprite_index = TreeCarrySpr
    if HaveResource = "Rock"
        sprite_index = RockCarrySpr
    if HaveResource = "Gold"
        sprite_index = GoldCarrySpr
        
    //Animate
    image_speed = 8/60
    if Target.x < x
        image_xscale = -1
    else
        image_xscale = 1    
    }


/* */
///Working
    

//Working Sprite
if global.WorkerStage = 0
if FoodReady = false
{
if Target != MyHouse and point_distance(x,y,Target.x,Target.y) < 3
    {
    sprite_index = WorkingSpr
    image_speed = 8/60
    if Target.x < x
        image_xscale = -1
    else
        image_xscale = 1 
    }
    
if point_distance(x,y,Mine.x,Mine.y) < Spd and Task = "Rock"
    {
    image_alpha = 0
    }
else
    image_alpha = 1
    
//Hit Trees
if Task = "Tree" and sprite_index = WorkingSpr
    if image_index div 1 = 5
        {
        Target.Health -= Level/6
        if !audio_is_playing(MySound)
            {
            if Target.image_index = 5
                MySound = audio_play_sound(PickAxe, 1, false)
            else
                MySound = audio_play_sound(Axe, 1, false)
            }
        }
    
//Hit Mine
if MineHealth < 1
    {
    if Task = "Rock"
        {
        Resource = irandom(9)
        if Resource = 3
            HaveResource = "Gold"
        else
            HaveResource = "Rock"
            
        Working = false
        }
    }

if Task = "Rock" and sprite_index = WorkingSpr
    {
    if image_index div 1 = 5
        {
        MineHealth -= Level/6 
        if !audio_is_playing(MySound)
            MySound = audio_play_sound(PickAxe, 1, false)
        }
    }
else
    MineHealth = 20
    
//Build
if Task = "Building" and sprite_index = WorkingSpr
    {
    if image_index div 1 = 5
    if !audio_is_playing(MySound)
        MySound = audio_play_sound(Hammering, 1, false)
    }
}

/* */
///Click on Buttons

if Selected == 1
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

//Harvest
if point_in_rectangle(mouse_x, mouse_y, ButtonLeft1, ButtonTop1, ButtonRight1, ButtonBottom1) //Top  
if Task != "Tree"
    {
    if HaveResource = "Tree"
        with instance_create(x,y,Dropped)
            {
            image_index = 0
            }
    if HaveResource = "Rock"
        with instance_create(x,y,RockDropped)
            {
            image_index = 1
            }
    if HaveResource = "Gold"
        with instance_create(x,y,RockDropped)
            {
            image_index = 2
            }
            
    Target.Targeted = false
    
    Target = MyHouse
    HaveResource = "None"
    Working = false
    Task = "Tree"        
    exit
    }
    
//Mine
if point_in_rectangle(mouse_x, mouse_y, ButtonLeft1, ButtonTop2, ButtonRight1, ButtonBottom2) //Top
if Task != "Rock"
    {  
    if HaveResource = "Tree"
        with instance_create(x,y,Dropped)
            {
            image_index = 0
            }
    if HaveResource = "Rock"
        with instance_create(x,y,RockDropped)
            {
            image_index = 1
            }
    if HaveResource = "Gold"
        with instance_create(x,y,RockDropped)
            {
            image_index = 2
            }
    
    Target.Targeted = false
      
    Target = MyHouse
    HaveResource = "None"
    Working = false
    Task = "Rock"
       
    exit
    }

//Build
if point_in_rectangle(mouse_x, mouse_y, ButtonLeft1, ButtonTop3, ButtonRight1, ButtonBottom3) //Top 
if Task != "Building"
    {
    Target.Targeted = false
        
    Target = MyHouse
    if HaveResource = "Tree"
        with instance_create(x,y,Dropped)
            {
            image_index = 0
            }
    if HaveResource = "Rock"
        with instance_create(x,y,RockDropped)
            {
            image_index = 1
            }
    if HaveResource = "Gold"
        with instance_create(x,y,RockDropped)
            {
            image_index = 2
            }
            
    HaveResource = "None"
    Working = false
    Task = "Building"
    exit
    }
}

/* */
///Victory

if Task = "Victory"
    {        
    //Go Home For Training
    if global.WorkerStage = 1
        {
        Target = Academy
        
        if point_distance(Academy.x, Academy.y, x, y) <= Spd
            {
            image_speed = 0
            }
        }
        
    //Attack Enemies
    if global.WorkerStage = 2
        {        
        sprite_index = WarriorSpr
        image_speed = 8/60

        if instance_exists(Enemy)
            {
            EnemyTarget = instance_nearest(MyHouse.x, MyHouse.y, Enemy)
            
            mp_potential_step(EnemyTarget.x, EnemyTarget.y, Spd, false)
            if EnemyTarget.x < x
                image_xscale = -1
            else
                image_xscale = 1  
            
            if place_meeting(x,y,EnemyTarget)
                {
                with EnemyTarget
                    Health = -1
                }
            }
        }
        
    //Go Home For Dragon Killing
    if global.WorkerStage = 3
        {
        Target = Academy
        sprite_index = WarriorSpr
        
        if point_distance(Academy.x, Academy.y, x, y) <= Spd
            {
            image_speed = 0
            }
        }
        
    //Walk Do Slay Dragon
    if global.WorkerStage = 4
        {    
        if ToDragon > 0
            sprite_index = WalkSpr
           
        if ToDragon = 1
            {
            mp_potential_step(room_width/2, room_height/2, Spd * 0.75, false)
            if room_width/2 < x
                image_xscale = -1
            else
                image_xscale = 1  
            }
            
        if point_distance(x,y,room_width/2, room_height/2) < Spd
            ToDragon = 2
                
        if ToDragon = 2
            {
            mp_potential_step(room_width + 30, y, Spd * 0.75, false)
            image_xscale = 1
            }
        }
    
    //Tracks if getting or leaving Home    
    if point_distance(Academy.x, Academy.y, x, y) <= Spd * 2
        {
        if AtHome = false
            {
            global.WorkersAtHouse += 1
            AtHome = true
            }
        exit
        }
    if point_distance(Academy.x, Academy.y, x, y) > Spd * 2
        if AtHome = true
            {
            global.WorkersAtHouse -= 1
            AtHome = false
            exit
            }
    }

/* */
///Food Ready

if FoodReady = true
    {
    if instance_exists(Homestead)
        {
        for(i = 0; i <= instance_number(Homestead); i ++)  //Go through all trees
            {
            FoodReady = false
            with instance_find(Homestead,i)
                if HasFood = 100
                    {
                    other.Target = instance_find(Homestead,other.i)
                    other.FoodReady = true
                    }
            }       
        }
    else
        FoodReady = false
    }

/* */
/*  */
