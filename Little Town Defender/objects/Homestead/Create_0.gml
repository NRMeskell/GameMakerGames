/// @description Looks and vars

HasFood = 0

HasHero = 0

Distance = 10
Repair = false

SellCost = global.FarmHouseCost div 2
SellWood = global.FarmHouseWood div 2
SellStone = global.FarmHouseStone div 2

//Upgrade/Select
Selected = false
MenuSize = 1.5
Edge = 5
CaptionPlace = 21
UpgradePlace = 35
Pierce = false
Punch = false

MySelector =  instance_create(x,y,Selectable)

with MySelector
    {
    MyThing = other
    mask_index = MyThing.mask_index
    }


//Fire Vars
ManyArrow = false
Range = 50
FireSpeed = 10
FireRate = 120
Damage = 1


Health = 10
MaxHealth = Health

BuildTop = 0
image_speed = 0
depth = -y
Targeted = false
image_index = 3


//Building vars
Created = false
Build = 100
BuildSpeed = global.HotelBuild
Placex = 0
instance_create(x,y,Building)




