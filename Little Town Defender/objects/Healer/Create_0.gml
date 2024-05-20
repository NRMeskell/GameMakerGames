/// @description Select

Selected = false
MenuSize = 1.5
Edge = 5
CaptionPlace = 21
UpgradePlace = 35
Pierce = false
Punch = false
Distance = 10

with instance_create(x,y,Selectable)
    {
    MyThing = other
    }

///Vars

Special = ""
Special2 = ""

ArrowRes = 1
MagicRes = 1
FireSpeed = 10

SightRange = 200
Range = 25
Points = 0

Fired = true

sprite_index = HealerSpr

image_speed = 8/60

MaxHealth = 10

Spd = 0.4

Healing = 0.2
Health = MaxHealth
Heal = TownHall

