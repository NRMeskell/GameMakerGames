/// @description Draw Buttons

image_blend = c_white
draw_sprite_ext(GUIMenuSpr, 0, MenuDistance, MenuDistance, 1, 1, 0, c_white, 1)

//Towers
draw_sprite(ArrowTowerSpr, 0, Left2Column, Row1)
draw_sprite(MagicTowerSpr, 0, Right2Column, Row1)

//House
draw_sprite(HouseSpr, 0, Left1Column, Row2)
draw_sprite(HouseSpr, 2, Middle1Column, Row2)
draw_sprite(HouseSpr, 5, Right1Column, Row2)

//Worker
draw_sprite(HouseSpr, 1, Left1Column, Row3)
draw_sprite(HouseSpr, 3, Middle1Column, Row3)
draw_sprite(HouseSpr, 6, Right1Column, Row3)

//Victory Buildings
draw_sprite(SpecialSpr, 7, Left1Column, Row4)
draw_sprite(SpecialSpr, 6, Middle1Column, Row4)
draw_sprite(SpecialSpr, 2, Right1Column, Row4)

//Special
draw_sprite(SpecialSpr, 0, Left2Column, Row5)
draw_sprite(SpecialSpr, 1, Right2Column, Row5)

//Walls
draw_sprite(WoodWallSpr, 0, Middle1Column, Row6)
draw_sprite(StoneWallSpr, 0, Middle1Column, Row7)

///Tell if can place

mask_index = Sprite

if place_meeting(mouse_x,mouse_y,NoPlace) or mouse_y < topDistance
    {
    image_blend = c_red
    }
else
    image_blend = c_green
    
if !(global.Gold >= Cost and global.Trees >= Wood and global.Rocks >= Stone)
    image_blend = c_red

///Draw Cost Dropdowns

DrawDrop = false

if TownHall.visible = true
{
///Arrow Tower Cost
if OnArrowTower
    {
    DrawDrop = true
    
    BuildName = "ArrowTower"
    
    BuildCost = global.ArrowCost
    BuildWood = global.ArrowWood
    BuildStone = global.ArrowStone
    
    BuildDes = "Fires arrows#at enemies"
    }
    
///Magic Tower Cost
if OnMagicTower
    {
    DrawDrop = true
    
    BuildName = "Magic Tower"
    
    BuildCost = global.MagicCost
    BuildWood = global.MagicWood
    BuildStone = global.MagicStone
   
    BuildDes = "Fires magic#at enemies"
    }
    
///House Cost
if OnHouse
    {
    DrawDrop = true
    
    BuildName = "House"
    
    BuildCost = global.HouseCost
    BuildWood = global.HouseWood
    BuildStone = global.HouseStone
   
    BuildDes = "Produces#gold"
    }
    
///Tavern Cost
if OnTavern
    {
    DrawDrop = true
    
    BuildName = "Tavern"
    
    BuildCost = global.TavernCost
    BuildWood = global.TavernWood
    BuildStone = global.TavernStone
   
    BuildDes = "Doubles#nearby house#production"
    }
    
///Inn Cost
if OnInn
    {
    DrawDrop = true
    
    BuildName = "Cathedral"
    
    BuildCost = global.HotelCost
    BuildWood = global.HotelWood
    BuildStone = global.HotelStone
   
    BuildDes = "Heals builds#based on#house number"
    }
    
///WorkHouse Cost
if OnWorkHouse
    {
    DrawDrop = true
    
    BuildName = "WorkHouse"
    
    BuildCost = global.WorkHouseCost
    BuildWood = global.WorkHouseWood
    BuildStone = global.WorkHouseStone
   
    BuildDes = "Creates a#worker"
    }
    
//Barn Cost
if OnFarmHouse
    {
    DrawDrop = true
    
    BuildName = "Mill"
    
    BuildCost = global.FarmHouseCost
    BuildWood = global.FarmHouseWood
    BuildStone = global.FarmHouseStone
   
    BuildDes = "Uses food#to level#up workers"
    }
    
//Farm
if OnFarm
    {
    DrawDrop = true
    
    BuildName = "Farm"
    
    BuildCost = global.FarmCost
    BuildWood = global.FarmWood
    BuildStone = global.FarmStone
   
    BuildDes = "Provides food#to nearby#Mills"
    }
    
///Academy Cost
if OnAcademy
    {
    DrawDrop = true
    
    BuildName = "Academy"
    
    BuildCost = global.AcademyCost
    BuildWood = global.AcademyWood
    BuildStone = global.AcademyStone
   
    BuildDes = "Trains#workers to#kill dragon"
    }
    
///Altar Cost
if OnAltar
    {
    DrawDrop = true
    
    BuildName = "Altar"
    
    BuildCost = global.BankCost
    BuildWood = global.BankWood
    BuildStone = global.BankStone
   
    BuildDes = "Can use#gold to#bribe dragon"
    }
    
///Gong Cost
if OnGong
    {
    DrawDrop = true
    
    BuildName = "Gong"
    
    BuildCost = global.GongCost
    BuildWood = global.GongWood
    BuildStone = global.GongStone
   
    BuildDes = "Can summon#dragon to#fight"
    }
    
///Blood Cost
if OnBloodStone
    {
    DrawDrop = true
    
    BuildName = "Bloodstone"
    
    BuildCost = global.BloodCost
    BuildWood = global.BloodWood
    BuildStone = global.BloodStone
   
    BuildDes = "Nearby kills#boost all#tower damage"
    }
    
///Magic Tower Cost
if OnBomb
    {
    DrawDrop = true
    
    BuildName = "Land Mine"
    
    BuildCost = global.MineCost
    BuildWood = global.MineWood
    BuildStone = global.MineStone
   
    BuildDes = "Explodes when#detonated#or killed"
    }
    
///Wood Wall Cost
if OnWoodWall
    {
    DrawDrop = true
    
    BuildName = "Wood Wall"
    
    BuildCost = global.WoodWallCost
    BuildWood = global.WoodWallWood
    BuildStone = global.WoodWallStone
   
    BuildDes = "Stops#enemies"
    }
    
///Stone Wall Cost
if OnStoneWall
    {
    DrawDrop = true
    
    BuildName = "Stone Wall"
    
    BuildCost = global.StoneWallCost
    BuildWood = global.StoneWallWood
    BuildStone = global.StoneWallStone
   
    BuildDes = "Stops#enemies"
    }

if DrawDrop == true
    {
    draw_set_valign(fa_center)
    draw_set_font(DisplayResourceFont)
    draw_sprite_ext(MenuArea, 0, mouse_x, mouse_y, 1.3, 1.1, 0, c_white, 1)

    draw_set_halign(fa_center)
    draw_text(mouse_x + sprite_get_width(MenuArea)*0.65, mouse_y + 3*DistanceDraw/2, string_hash_to_newline(BuildName))
    
    draw_set_halign(fa_left)
    draw_text(mouse_x + sprite_get_width(MenuArea) * 0.25 + 6, mouse_y + 3*DistanceDraw+5, string_hash_to_newline(BuildCost))
    draw_text(mouse_x + sprite_get_width(MenuArea) * 0.25 + 6, mouse_y + 4*DistanceDraw+5, string_hash_to_newline(BuildWood))
    draw_text(mouse_x + sprite_get_width(MenuArea) * 0.25 + 6, mouse_y + 5*DistanceDraw+5, string_hash_to_newline(BuildStone))
   
    draw_set_font(DiscriptionFont)
    draw_set_valign(fa_top)
    draw_text(mouse_x + sprite_get_width(MenuArea) * 0.25 - 7, mouse_y + 6.6*DistanceDraw, string_hash_to_newline(BuildDes))
     
    draw_sprite(ResourcesSpr, 0, mouse_x + sprite_get_width(MenuArea) * 0.25 - 3, mouse_y + 3*DistanceDraw+5) 
    draw_sprite(ResourcesSpr, 1, mouse_x + sprite_get_width(MenuArea) * 0.25 - 3, mouse_y + 4*DistanceDraw+5) 
    draw_sprite(ResourcesSpr, 2, mouse_x + sprite_get_width(MenuArea) * 0.25 - 3, mouse_y + 5*DistanceDraw+5)
    }
}

///Draw Carried Object

if ObjectPlace != "None"
if TownHall.visible = true
    {
    draw_sprite_ext(Sprite, Rotation, mouse_x, mouse_y, 1, 1, 0, image_blend, 0.75)
    
    if Sprite = ArrowTowerSpr or Sprite = MagicTowerSpr
        {
        draw_set_circle_precision(32);
        draw_circle(mouse_x,mouse_y-11, 150, true)
        }
    
    if Sprite = HouseSpr and Rotation = 2
        {
        draw_set_circle_precision(32);
        draw_circle(mouse_x,mouse_y-8, 30, true)
        }
        
    if Sprite = HouseSpr and Rotation = 3
        {
        draw_set_circle_precision(32);
        draw_circle(mouse_x,mouse_y-8, 50, true)
        }
        
    if Sprite = SpecialSpr and Rotation = 0
        {
        draw_set_circle_precision(32);
        draw_circle(mouse_x,mouse_y-8, 100, true)
        }
    }

