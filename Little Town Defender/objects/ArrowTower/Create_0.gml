/// @description Looks and vars

DamageDelt = 0

BloodDam = 0

Repair = false

SellCost = global.ArrowCost div 2
SellWood = global.ArrowWood div 2
SellStone = global.ArrowStone div 2

//Upgrade/Select
Selected = false
MenuSize = 1.5
Edge = 5
CaptionPlace = 21
UpgradePlace = 35
Pierce = false
Punch = false
Snipe = false

with instance_create(x,y,Selectable)
    {
    MyThing = other
    mask_index = MyThing.mask_index
    }


//Fire Vars
Range = 150
FireSpeed = 15
FireRate = 120
Damage = 1

Stun = false
ManyArrow = false
Pierce = false
Stun = false


Health = 10
MaxHealth = Health

BuildTop = 0
image_speed = 0
depth = -y
Targeted = false


//Building vars
Created = false
Build = 100
BuildSpeed = global.ArrowBuild
Placex = 0
instance_create(x,y,Building)


///Button Vars

ButtonLeft1 = __view_get( e__VW.WView, 0 ) - sprite_get_width(ButtonsSpr) * MenuSize - 15
ButtonRight1 = __view_get( e__VW.WView, 0 ) - 15

ButtonTop1 = __view_get( e__VW.HView, 0 ) - Edge - sprite_get_height(MenuArea) * MenuSize * 3/5 - sprite_get_height(ButtonsSpr) * MenuSize/2
ButtonBottom1 = __view_get( e__VW.HView, 0 ) - Edge - sprite_get_height(MenuArea) * MenuSize * 3/5 + sprite_get_height(ButtonsSpr) * MenuSize/2 

ButtonTop2 = __view_get( e__VW.HView, 0 ) - Edge - sprite_get_height(MenuArea) * MenuSize * 2/5 - sprite_get_height(ButtonsSpr) * MenuSize/2-5
ButtonBottom2 = __view_get( e__VW.HView, 0 ) - Edge - sprite_get_height(MenuArea) * MenuSize * 2/5 + sprite_get_height(ButtonsSpr) * MenuSize/2-5

ButtonTop3 = __view_get( e__VW.HView, 0 ) - Edge - sprite_get_height(MenuArea) * MenuSize * 1/5 - sprite_get_height(ButtonsSpr) * MenuSize/2+5
ButtonBottom3 = __view_get( e__VW.HView, 0 ) - Edge - sprite_get_height(MenuArea) * MenuSize * 1/5 + sprite_get_height(ButtonsSpr) * MenuSize/2+5


