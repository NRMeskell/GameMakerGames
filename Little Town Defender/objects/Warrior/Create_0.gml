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

Special = ""
Special2 = ""
Punch = false

ArrowRes = 1
MagicRes = 1

SightRange = 200

image_speed = 8/60

MaxHealth = 30

Spd = 0.3

Damage = 6

for(i=0; i<Points; i++)
    {
    LevelUp = choose("Damage", "Speed", "Health", "Damage")
    
    if LevelUp = "Damage"
        {
        Damage += 3
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
        MaxHealth += 20
        if Special = ""
            Special = "Tough"
        else
            Special2 = "Tough"
        }
    }
    
Health = MaxHealth

