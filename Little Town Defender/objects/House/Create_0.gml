with (other) {
///Looks and vars

Distance = 10

Repair = false

SellCost = global.HouseCost div 2
SellWood = global.HouseWood div 2
SellStone = global.HouseStone div 2


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
FireRate = 240
Damage = 1


Health = 3
MaxHealth = Health

BuildTop = 0
image_speed = 0
depth = -y
Targeted = false


//Building vars
Created = false
Build = 100
BuildSpeed = global.HouseBuild
Placex = 0
instance_create(x,y,Building)


}
