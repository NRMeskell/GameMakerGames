/// @description Select

Selected = false
MenuSize = 1.5
Edge = 5
CaptionPlace = 21
UpgradePlace = 35
Pierce = false
Punch = false
Distance = 10
DamageDelt = 0

with instance_create(x,y,Selectable)
    {
    MyThing = other
    }

///Vars

Points = 2

ArrowRes = 1
MagicRes = 1
FireSpeed = 15
Stun = false

SightRange = 200
Range = 120

Fired = true

sprite_index = ArcherSpr

image_speed = 8/60

MaxHealth = 10

Spd = 0.4

Special = ""
Special2 = ""

Damage = 2

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
        Spd += 0.2
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
        
    if LevelUp = "Pierce"
    if Special != "Piercing"
        {
        Pierce = true
        if Special = ""
            Special = "Piercing"
        else
            Special2 = "Piercing"
        }
        
    if LevelUp = "Knock"
    if Special != "Powerful"
        {
        Punch = true
        if Special = ""
            Special = "Powerful"
        else
            Special2 = "Powerful"
        }
    }
    
Health = MaxHealth

