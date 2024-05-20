/// @description Looks and vars

Repair = false

SellCost = 10
SellWood = 0
SellStone = 0

StrongCost = 225
StrongWood = 0
StrongStone = 2

SniperCost = 200
SniperWood = 3
SniperStone = 0

HeavyCost = 350
HeavyWood = 2
HeavyStone = 2

SprayCost = 400
SprayWood = 4
SprayStone = 1

PierceCost = 300
PierceWood = 3
PierceStone = 1

PunchCost = 350
PunchWood = 1
PunchStone = 2

//Upgrade/Select
Selected = false
MenuSize = 1.5
Edge = 5
CaptionPlace = 21
UpgradePlace = 35
Pierce = false
Punch = false

//Fire Vars
ManyArrow = false
Range = 120
FireSpeed = 10
FireRate = 120
Damage = 1


Health = 150
MaxHealth = Health

BuildTop = 0
image_speed = 0
depth = 100
Targeted = false


//Building vars
Created = false
Build = 100
BuildSpeed = global.WoodWallBuild
Placex = 0
instance_create(x,y,Building)

///Can't Be Placed on 
MyNoWallPlace = instance_create(x,y,NoWallPlace)


with instance_create(x,y,Selectable)
    {
    MyThing = other
    sprite_index = MyThing.sprite_index
    image_index = MyThing.image_index
    }


