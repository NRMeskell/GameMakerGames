/// @description Looks and vars

global.WorkersAtHouse = 0
wr =0
i = 0

Distance = 10

Repair = false

Level = 1

SellCost = global.AcademyCost div 2
SellWood = global.AcademyWood div 2
SellStone = global.AcademyStone div 2

ArmyCost = 0
ArmyWood = 0
ArmyStone = 0

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
Range = 120
FireSpeed = 10
FireRate = 120  
Damage = 1


Health = 5
MaxHealth = Health

BuildTop = 0
image_speed = 0
depth = -y
Targeted = false


//Building vars
Created = false
Build = 100
BuildSpeed = global.AcademyBuild
Placex = 0

instance_create(x,y,Building)

image_index = 7


