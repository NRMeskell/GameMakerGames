/// @description Restart Game (New Game)
/// @param New Game

room_persistent = true

if global.Restart = true
    {
    global.Restart = false
    room_persistent = false
    room_restart()
    }

///Losing Code

if Health < 1
if visible = true
    {
    with instance_create(x,y,Crumble)
        {
        sprite_index = other.sprite_index
        image_index = other.image_index
        image_alpha = other.image_alpha
        }
        
    visible = false
    }

///Level Setter

Level = global.LevelSelect

/*///Click on Buttons

if Selected == 1
if mouse_check_button_pressed(mb_left)
{
ButtonLeft1 = view_wview - sprite_get_width(ButtonsSpr) * MenuSize - 15
ButtonLeft2 = view_wview - 15 - sprite_get_width(ButtonsSpr)/2 * MenuSize + 5

ButtonRight1 = view_wview - 15
ButtonRight2 = view_wview - 15 - sprite_get_width(ButtonsSpr)/2 * MenuSize - 5

ButtonTop1 = view_hview - Edge - sprite_get_height(MenuArea) * MenuSize * 3/5 - sprite_get_height(ButtonsSpr) * MenuSize/2
ButtonBottom1 = view_hview - Edge - sprite_get_height(MenuArea) * MenuSize * 3/5 + sprite_get_height(ButtonsSpr) * MenuSize/2 

ButtonTop2 = view_hview - Edge - sprite_get_height(MenuArea) * MenuSize * 2/5 - sprite_get_height(ButtonsSpr) * MenuSize/2
ButtonBottom2 = view_hview - Edge - sprite_get_height(MenuArea) * MenuSize * 2/5 + sprite_get_height(ButtonsSpr) * MenuSize/2 

ButtonTop3 = view_hview - Edge - sprite_get_height(MenuArea) * MenuSize * 1/5 - sprite_get_height(ButtonsSpr) * MenuSize/2
ButtonBottom3 = view_hview - Edge - sprite_get_height(MenuArea) * MenuSize * 1/5 + sprite_get_height(ButtonsSpr) * MenuSize/2 


//Upgrade Once
if point_in_rectangle(mouse_x, mouse_y, ButtonLeft1, ButtonTop2, ButtonRight1, ButtonBottom2) //Top
if global.Gold >= global.Hall1Cost
if global.Trees >= global.Hall1Wood
if global.Rocks >= global.Hall1Stone
if image_index = 0    
    {
    global.Gold -= global.Hall1Cost
    global.Trees -= global.Hall1Wood
    global.Rocks -= global.Hall1Stone
    
    SellCost = global.Hall1Cost div 2
    SellWood = global.Hall1Wood div 2
    SellStone = global.Hall1Stone div 2
    
    //Upgrades
    image_index = 1
    Health += 100
    MaxHealth += 100
    
    MyLevel += 0.5
    
    for(i=0; i < instance_number(Worker); i ++)
            {
            ThisWorker = instance_find(Worker,i)
            
            if ThisWorker.MyHouse = id
                ThisWorker.Level += 0.5
            }
    exit
    }
    
//Upgrade Twice
if point_in_rectangle(mouse_x, mouse_y, ButtonLeft1, ButtonTop2, ButtonRight1, ButtonBottom2) //Top
if global.Gold >= global.Hall2Cost
if global.Trees >= global.Hall1Wood
if global.Rocks >= global.Hall1Stone
if image_index = 1 
    {
    global.Gold -= global.Hall1Cost
    global.Trees -= global.Hall1Wood
    global.Rocks -= global.Hall1Stone
    
    SellCost = global.Hall2Cost div 2
    SellWood = global.Hall2Wood div 2
    SellStone = global.Hall2Stone div 2
    
    //Upgrades
    image_index = 2
    Health += 200
    MaxHealth += 200
    
    MyLevel += 0.5
    
    for(i=0; i < instance_number(Worker); i ++)
            {
            ThisWorker = instance_find(Worker,i)
            
            if ThisWorker.MyHouse = id
                ThisWorker.Level += 0.5
            }
    exit
    }
    
}

/* */
/*  */
