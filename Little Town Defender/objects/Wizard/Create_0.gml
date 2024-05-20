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

Points = 2

ArrowRes = 1
MagicRes = 1
FireSpeed = 5
ManyArrow = false
DamageDelt = 0

SightRange = 200
Range = 120

Fired = true

sprite_index = ArcherSpr

image_speed = 8/60

MaxHealth = 10

Spd = 0.2

Special = ""
Special2 = ""

Damage = 3

Selected = false
MenuSize = 1.5
Edge = 5
CaptionPlace = 21
UpgradePlace = 35
Fire = false
Light = false
Explode = false
Burn = 1
LightRange = 75
LightDirection = 45
Stun = false
FireRate = 120
FireTime = 0

for(i=0; i<Points; i++)
    {
    LevelUp = choose("Damage", "Speed", "Health")
    
    if LevelUp = "Damage"
        {
        Damage += 2
        if Special = ""
            Special = "Damaging"
        else
            Special2 = "Damaging"
        }
        
    if LevelUp = "Speed"
        {
        Spd += 0.1
        SightRange += 100
        if Special = ""
            Special = "Fast"
        else
            Special2 = "Fast"
        }
        
    if LevelUp = "Health"
        {
        MaxHealth += 10
        if Special = ""
            Special = "Tough"
        else
            Special2 = "Tough"
        }
        
    if LevelUp = "Light"
    if Special != "Lightning"
        {
        Light = true
        Damage -= 1
        if Special = ""
            Special = "Lightning"
        else
            Special2 = "Lightning"
        }
        
    if LevelUp = "Fire"
    if Special != "Fire"
        {
        Fire = true
        if Special = ""
            Special = "Fire"
        else
            Special2 = "Fire"
        }
    }
    
Health = MaxHealth

