/// @description Test On Buttons

OnArrowTower = point_in_circle(mouse_x,mouse_y, Left2Column, Row1 - sprite_get_height(ArrowTowerSpr)/2, sprite_get_height(ArrowTowerSpr)/2)
OnMagicTower = point_in_circle(mouse_x,mouse_y, Right2Column, Row1 - sprite_get_height(ArrowTowerSpr)/2, sprite_get_height(ArrowTowerSpr)/2)

OnHouse = point_in_circle(mouse_x,mouse_y, Left1Column, Row2 - sprite_get_height(ArrowTowerSpr)/2, sprite_get_height(ArrowTowerSpr)/2)
OnTavern = point_in_circle(mouse_x,mouse_y, Middle1Column, Row2 - sprite_get_height(ArrowTowerSpr)/2, sprite_get_height(ArrowTowerSpr)/2)
OnInn = point_in_circle(mouse_x,mouse_y, Right1Column, Row2 - sprite_get_height(ArrowTowerSpr)/2, sprite_get_height(ArrowTowerSpr)/2)

OnWorkHouse = point_in_circle(mouse_x,mouse_y, Left1Column, Row3 - sprite_get_height(ArrowTowerSpr)/2, sprite_get_height(ArrowTowerSpr)/2)
OnFarmHouse = point_in_circle(mouse_x,mouse_y, Middle1Column, Row3 - sprite_get_height(ArrowTowerSpr)/2, sprite_get_height(ArrowTowerSpr)/2)
OnFarm = point_in_circle(mouse_x,mouse_y, Right1Column, Row3 - sprite_get_height(ArrowTowerSpr)/2, sprite_get_height(ArrowTowerSpr)/2)

OnAcademy = point_in_circle(mouse_x,mouse_y, Left1Column, Row4 - sprite_get_height(ArrowTowerSpr)/2, sprite_get_height(ArrowTowerSpr)/2)
OnAltar = point_in_circle(mouse_x,mouse_y, Middle1Column, Row4 - sprite_get_height(ArrowTowerSpr)/2, sprite_get_height(ArrowTowerSpr)/2)
OnGong = point_in_circle(mouse_x,mouse_y, Right1Column, Row4 - sprite_get_height(ArrowTowerSpr)/2, sprite_get_height(ArrowTowerSpr)/2)

OnBloodStone = point_in_circle(mouse_x,mouse_y, Left2Column, Row5 - sprite_get_height(ArrowTowerSpr)/2, sprite_get_height(ArrowTowerSpr)/2)
OnBomb = point_in_circle(mouse_x,mouse_y, Right2Column, Row5 - sprite_get_height(ArrowTowerSpr)/2, sprite_get_height(ArrowTowerSpr)/2)

OnWoodWall = point_in_rectangle(mouse_x,mouse_y,Middle1Column-sprite_get_width(WoodWallSpr)/2,Row6 - 18, Middle1Column+sprite_get_width(WoodWallSpr)/2,Row6)
OnStoneWall = point_in_rectangle(mouse_x,mouse_y,Middle1Column-sprite_get_width(WoodWallSpr)/2,Row7 - 18, Middle1Column+sprite_get_width(WoodWallSpr)/2,Row7)


///Grab Objects

if TownHall.visible = true
if mouse_check_button_pressed(mb_left)
{
///Arrow Tower Cost
if OnArrowTower
    {
    ObjectPlace = "Arrow"
    Sprite = ArrowTowerSpr
    Placed = ArrowTower
    Rotation = 0
    
    Cost = global.ArrowCost
    Wood = global.ArrowWood
    Stone = global.ArrowStone
    }
    
///Magic Tower Cost
if OnMagicTower
    {
    ObjectPlace = "Magic"
    Sprite = MagicTowerSpr
    Placed = MagicTower
    Rotation = 0
    
    Cost = global.MagicCost
    Wood = global.MagicWood
    Stone = global.MagicStone
    }
    
///House Cost
if OnHouse
    {
    ObjectPlace = "House"
    Sprite = HouseSpr
    Placed = House
    Rotation = 0
    
    Cost = global.HouseCost
    Wood = global.HouseWood
    Stone = global.HouseStone
    }
    
///WorkHouse Cost
if OnWorkHouse
    {
    ObjectPlace = "WorkShop"
    Sprite = HouseSpr
    Placed = WorkHouse
    Rotation = 1
    
    Cost = global.WorkHouseCost
    Wood = global.WorkHouseWood
    Stone = global.WorkHouseStone
    }
    
///Tavern Cost
if OnTavern
    {
    ObjectPlace = "Tavern"
    Sprite = HouseSpr
    Placed = Tavern
    Rotation = 2
    
    Cost = global.TavernCost
    Wood = global.TavernWood
    Stone = global.TavernStone
    }
    
///Inn Cost
if OnInn
    {
    ObjectPlace = "Inn"
    Sprite = HouseSpr
    Placed = Inn
    Rotation = 5
    
    Cost = global.HotelCost
    Wood = global.HotelWood
    Stone = global.HotelStone
    }
    
///HomeStead Cost
if OnFarmHouse
    {
    ObjectPlace = "Homestead"
    Sprite = HouseSpr
    Placed = Homestead
    Rotation = 3
    
    Cost = global.FarmHouseCost
    Wood = global.FarmHouseWood
    Stone = global.FarmHouseStone
    }
    
///HomeStead Cost
if OnFarm
    {
    ObjectPlace = "Farm"
    Sprite = HouseSpr
    Placed = Farm
    Rotation = 6
    
    Cost = global.FarmCost
    Wood = global.FarmWood
    Stone = global.FarmStone
    }
    
///Academy Cost
if OnAcademy
    {
    ObjectPlace = "Academy"
    Sprite = SpecialSpr
    Placed = Academy
    Rotation = 7
    
    Cost = global.AcademyCost
    Wood = global.AcademyWood
    Stone = global.AcademyStone
    }
    
///Bank Cost
if OnAltar
    {
    ObjectPlace = "Altar"
    Sprite = SpecialSpr
    Placed = Altar
    Rotation = 6
    
    Cost = global.BankCost
    Wood = global.BankWood
    Stone = global.BankStone
    }
    
///Summoning Gong Cost
if OnGong
    {
    ObjectPlace = "Gong"
    Sprite = SpecialSpr
    Placed = Gong
    Rotation = 2
    
    Cost = global.GongCost
    Wood = global.GongWood
    Stone = global.GongStone
    }
    
///Blood Cost
if OnBloodStone
    {
    ObjectPlace = "Blood"
    Sprite = SpecialSpr
    Placed = Bloodstone
    Rotation = 0
    
    Cost = global.BloodCost
    Wood = global.BloodWood
    Stone = global.BloodStone
    }
    
///Bomb Cost
if OnBomb
    {
    ObjectPlace = "Bomb"
    Sprite = SpecialSpr
    Placed = Bomb
    Rotation = 1
    
    Cost = global.MineCost
    Wood = global.MineWood
    Stone = global.MineStone
    }
    
    
///Wood Wall Cost
if OnWoodWall
    {
    ObjectPlace = "Wood Wall"
    Sprite = WoodWallSpr
    Placed = WoodWall
    Rotation = 0
    
    Cost = global.WoodWallCost
    Wood = global.WoodWallWood
    Stone = global.WoodWallStone
    }
    
///Stone Wall Cost
if OnStoneWall
    {
    ObjectPlace = "Stone Wall"
    Sprite = StoneWallSpr
    Placed = StoneWall
    Rotation = 0
    
    Cost = global.StoneWallCost
    Wood = global.StoneWallWood
    Stone = global.StoneWallStone
    }   
}

///PlaceObjects
mask_index = Sprite
image_index = Rotation

if TownHall.visible = true
if global.Gold >= Cost and global.Trees >= Wood and global.Rocks >= Stone
if ObjectPlace != "None"
if mouse_check_button_pressed(mb_left)
if mouse_x > sprite_get_width(MenuArea) * 1.2 + 10 or mouse_y > sprite_get_height(MenuArea) * 1.2 + 10
    {
    if !place_meeting(mouse_x, mouse_y, NoPlace) and mouse_y > topDistance
        {
        global.Gold -= Cost
        global.Trees -= Wood
        global.Rocks -= Stone
        
        if Placed = WoodWall or Placed = StoneWall
            {
            with instance_create(mouse_x, mouse_y, Placed)
                image_index = other.Rotation
            }
            
        else
            {
            instance_create(mouse_x, mouse_y, Placed)
            }
        audio_play_sound(PlacingBuilding, 2, false)
        }
    }

///Gone with End Game

visible = true

if TownHall.visible = false
    visible = false

///Rotate

if Placed = WoodWall or Placed = StoneWall
    {
    image_index = Rotation
    
    if keyboard_check_pressed(ord("D"))
        Rotation += 1
    if keyboard_check_pressed(ord("A"))
        Rotation -= 1
        
    //Check that rotation is correct
    if Rotation > sprite_get_number(Sprite) - 1
        Rotation = 0
    if Rotation < 0
        Rotation = sprite_get_number(Sprite) - 1
    }
    


