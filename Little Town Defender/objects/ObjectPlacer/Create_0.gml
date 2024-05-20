/// @description GUI Menu Areas

MenuDistance = 5
BetweenDistance = 5
Middlex = MenuDistance + sprite_get_width(GUIMenuSpr)/2
topDistance = 25

Row1 = MenuDistance + 2*BetweenDistance + sprite_get_height(ArrowTowerSpr)
Row2 = MenuDistance + 2*BetweenDistance + 2*sprite_get_height(ArrowTowerSpr)
Row3 = MenuDistance + 2*BetweenDistance + 3*sprite_get_height(ArrowTowerSpr)
Row4 = MenuDistance + 2*BetweenDistance + 4*sprite_get_height(ArrowTowerSpr)
Row5 = MenuDistance + 2*BetweenDistance + 5*sprite_get_height(ArrowTowerSpr)
Row6 = MenuDistance + 2*BetweenDistance + 6*sprite_get_height(ArrowTowerSpr)
Row7 = MenuDistance + 2*BetweenDistance + 7*sprite_get_height(ArrowTowerSpr)

Left1Column = Middlex - BetweenDistance - sprite_get_width(ArrowTowerSpr)
Middle1Column = Middlex
Right1Column = Middlex + BetweenDistance + sprite_get_width(ArrowTowerSpr)

Left2Column = Middlex - BetweenDistance/2 - sprite_get_width(ArrowTowerSpr)/2
Right2Column = Middlex + BetweenDistance/2 + sprite_get_width(ArrowTowerSpr)/2


///Test On Buttons

OnArrowTower = point_in_circle(mouse_x,mouse_y, Left2Column, Row1 - sprite_get_height(ArrowTowerSpr)/2, sprite_get_width(ArrowTowerSpr)/2)
OnMagicTower = point_in_circle(mouse_x,mouse_y, Right2Column, Row1 - sprite_get_height(ArrowTowerSpr)/2, sprite_get_width(ArrowTowerSpr)/2)

OnHouse = point_in_circle(mouse_x,mouse_y, Left1Column, Row2 - sprite_get_height(ArrowTowerSpr)/2, sprite_get_width(ArrowTowerSpr)/2)
OnTavern = point_in_circle(mouse_x,mouse_y, Middle1Column, Row2 - sprite_get_height(ArrowTowerSpr)/2, sprite_get_width(ArrowTowerSpr)/2)
OnInn = point_in_circle(mouse_x,mouse_y, Right1Column, Row2 - sprite_get_height(ArrowTowerSpr)/2, sprite_get_width(ArrowTowerSpr)/2)

OnWorkHouse = point_in_circle(mouse_x,mouse_y, Left1Column, Row3 - sprite_get_height(ArrowTowerSpr)/2, sprite_get_width(ArrowTowerSpr)/2)
OnFarmHouse = point_in_circle(mouse_x,mouse_y, Middle1Column, Row3 - sprite_get_height(ArrowTowerSpr)/2, sprite_get_width(ArrowTowerSpr)/2)
OnFarm = point_in_circle(mouse_x,mouse_y, Right1Column, Row3 - sprite_get_height(ArrowTowerSpr)/2, sprite_get_width(ArrowTowerSpr)/2)

OnAcademy = point_in_circle(mouse_x,mouse_y, Left1Column, Row4 - sprite_get_height(ArrowTowerSpr)/2, sprite_get_width(ArrowTowerSpr)/2)
OnAltar = point_in_circle(mouse_x,mouse_y, Middle1Column, Row4 - sprite_get_height(ArrowTowerSpr)/2, sprite_get_width(ArrowTowerSpr)/2)
OnGong = point_in_circle(mouse_x,mouse_y, Right1Column, Row4 - sprite_get_height(ArrowTowerSpr)/2, sprite_get_width(ArrowTowerSpr)/2)


OnBloodStone = point_in_circle(mouse_x,mouse_y, Left2Column, Row5 - sprite_get_height(ArrowTowerSpr)/2, sprite_get_width(ArrowTowerSpr)/2)
OnBomb = point_in_circle(mouse_x,mouse_y, Right2Column, Row5 - sprite_get_height(ArrowTowerSpr)/2, sprite_get_width(ArrowTowerSpr)/2)

OnWoodWall = point_in_circle(mouse_x,mouse_y, Middle1Column, Row6 - sprite_get_height(ArrowTowerSpr)/2, sprite_get_width(ArrowTowerSpr)/2)
OnStoneWall = point_in_circle(mouse_x,mouse_y, Middle1Column, Row7 - sprite_get_height(ArrowTowerSpr)/2, sprite_get_width(ArrowTowerSpr)/2)


///Costs

Cost = 0
Wood = 0
Stone = 0

//Walls
global.WoodWallCost = 100
global.WoodWallWood = 1
global.WoodWallStone = 0
global.WoodWallBuild = 0.3

global.StoneWallCost = 300
global.StoneWallWood = 0
global.StoneWallStone = 3
global.StoneWallBuild = 0.05

global.ArrowCost = 200
global.ArrowWood = 2
global.ArrowStone = 0
global.ArrowBuild = 0.2

global.MagicCost = 300
global.MagicWood = 3
global.MagicStone = 1
global.MagicBuild = 0.2

global.HouseCost = 50
global.HouseWood = 1
global.HouseStone = 1
global.HouseBuild = 0.5

global.WorkHouseCost = 450
global.WorkHouseWood = 3
global.WorkHouseStone = 4
global.WorkHouseBuild = 0.15

global.TavernCost = 600
global.TavernWood = 6
global.TavernStone = 3
global.TavernBuild = 0.1

global.HotelCost = 1000
global.HotelWood = 10
global.HotelStone = 5
global.HotelBuild = 0.05

global.FarmHouseCost = 600
global.FarmHouseWood = 6
global.FarmHouseStone = 6
global.FarmHouseBuild = 0.2

global.FarmCost = 100
global.FarmWood = 2
global.FarmStone = 1
global.FarmBuild = 0.5

global.BloodCost = 400
global.BloodWood = 2
global.BloodStone = 5
global.BloodBuild = 0.1

global.MineCost = 300
global.MineWood = 4
global.MineStone = 1
global.MineBuild = 0.2

global.GongCost = 500
global.GongWood = 3
global.GongStone = 3
global.GongBuild = 0.1

global.BankCost = 500
global.BankWood = 1
global.BankStone = 4
global.BankBuild = 0.1

global.AcademyCost = 500
global.AcademyWood = 3
global.AcademyStone = 3
global.AcademyBuild = 0.1

///Upgrade Costs

//Arrow
global.Upgrade1Build = 0.1
global.Upgrade2Build = 0.05

global.StrongCost = 800
global.StrongWood = 3
global.StrongStone = 5

global.SniperCost = 600
global.SniperWood = 5
global.SniperStone = 2

global.HeavyCost = 2000
global.HeavyWood = 7
global.HeavyStone = 5

global.SprayCost = 1500
global.SprayWood = 6
global.SprayStone = 4

global.PierceCost = 1500
global.PierceWood = 3
global.PierceStone = 7

global.PunchCost = 3000
global.PunchWood = 6
global.PunchStone = 6

//Magic

global.FireCost = 1000
global.FireWood = 8
global.FireStone = 1

global.LightningCost = 800
global.LightningWood = 3
global.LightningStone = 5

global.BombCost = 2400
global.BombWood = 5
global.BombStone = 6

global.EmberCost = 2000
global.EmberWood = 12
global.EmberStone = 0

global.ShockCost = 3500
global.ShockWood = 4
global.ShockStone = 6

global.ChainCost = 3000
global.ChainWood = 4
global.ChainStone = 5

global.BetterWorkerCost = 600
global.BetterWorkerWood = 3
global.BetterWorkerStone = 5

global.Hall1Cost = 1000
global.Hall1Wood = 6
global.Hall1Stone = 4

global.Hall2Cost = 3000
global.Hall2Wood = 10
global.Hall2Stone = 5





///Vars and sprites

global.BeenSelected = false

Sprite = MagicSpr

Edge = 6

ObjectPlace = "None"
Rotation = 0
MenuDistance = 5

DistanceDraw = 10

Placed = ArrowTower

