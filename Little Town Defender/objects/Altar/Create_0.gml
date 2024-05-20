/// @description Looks and vars

GoldDinging = 0

Distance = 10

Repair = false

Level = 1

SellCost = global.BankCost div 2
SellWood = global.BankWood div 2
SellStone = global.BankStone div 2

BribeCost = 10000
BribeWood = 0
BribeStone = 0

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
BuildSpeed = global.BankBuild
Placex = 0

instance_create(x,y,Building)

image_index = 6


