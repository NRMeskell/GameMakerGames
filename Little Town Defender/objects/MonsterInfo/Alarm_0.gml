/// @description Set Monster Type

if image_index = 1
    {
    MonsterRate = 800 + TownHall.Level * 180
    Monster = Orc
    Name = "Orc"
    Damage = global.OrcDam
    Spd = global.OrcSpd * 10
    Health = global.OrcHealth
    
    Specialty = "None"
    }
    
if image_index = 2
    {
    MonsterRate = 2000 + TownHall.Level * 300
    Monster = Oger
    Name = "Oger"
    Damage = global.OgerDam
    Spd = global.OgerSpd * 10
    Health = global.OgerHealth
    
    Specialty = "None"
    }
    
if image_index = 3
    {
    MonsterRate = 800 + TownHall.Level * 180
    Monster = Ooze
    Name = "Acid Ooze"
    Damage = global.OozeDam
    Spd = global.OozeSpd * 10
    Health = global.OozeHealth
    
    Specialty = "Leaves Acid#When Killed"
                 
    }
    
if image_index = 4
    {
    MonsterRate = 600 + TownHall.Level * 200
    Monster = Imp
    Name = "Imp"
    Damage = global.ImpDam
    Spd = global.ImpSpd * 10
    Health = global.ImpHealth
    
    Specialty = "Shoots#FireBalls"
    }
    
if image_index = 5
    {
    MonsterRate = 1000 + TownHall.Level * 200
    Monster = Skeleton
    Name = "Skeleton"
    Damage = global.SkeleDam
    Spd = global.SkeleSpd * 10
    Health = global.SkeleHealth
    
    Specialty = "Not Hurt#By Arrows"
    }
    
if image_index = 6
    {
    MonsterRate = 300 + TownHall.Level * 20
    Monster = Spider
    Name = "Spider"
    Damage = global.SpiderDam
    Spd = global.SpiderSpd * 10
    Health = global.SpiderHealth
    
    Specialty = "None"
    }
    
if image_index = 7
    {
    MonsterRate = 3000 + TownHall.Level * 500
    Monster = Troll
    Name = "Troll"
    Damage = global.TrollDam
    Spd = global.TrollSpd * 10
    Health = global.TrollHealth
    
    Specialty = "None"
    }
    
if image_index = 8
    {
    MonsterRate = 2000 + TownHall.Level * 400
    Monster = Drake
    Name = "Drake"
    Damage = global.DrakeDam
    Spd = global.DrakeSpd * 10
    Health = global.DrakeHealth
    
    Specialty = "Shoots#Fireballs"
    }
    
if image_index = 9
    {
    MonsterRate = 2000 + TownHall.Level * 400
    Monster = Ghost
    Name = "Ghost"
    Damage = global.GhostDam
    Spd = global.GhostSpd * 10
    Health = global.GhostHealth
    
    Specialty = "Ignores#Walls"
    }
    
if image_index = 10
    {
    MonsterRate = 2000 + TownHall.Level * 400
    Monster = Elemental
    Name = "Elemental"
    Damage = global.ElementalDam
    Spd = global.ElementalSpd * 10
    Health = global.ElementalHealth
    
    Specialty = "Not Hurt#By Magic"
    }
    
if image_index = 11
    {
    MonsterRate = 2000 + TownHall.Level * 400
    Monster = Ent
    Name = "Ent"
    Damage = global.EntDam
    Spd = global.EntSpd * 10
    Health = global.EntHealth
    
    Specialty = "Comes When#Trees Cut"
    }
    
if image_index = 12
    {
    MonsterRate = 1000 + TownHall.Level * 400
    Monster = Roller
    Name = "Roller"
    Damage = global.RollerDam
    Spd = global.RollerSpd * 10
    Health = global.RollerHealth
    
    Specialty = "Explodes#On Contact"
    }
    
    

///Spawn Monsters

if image_index != 11
{
Direction = irandom(4)

if Direction = 0
    {
    Height = random_range(288, room_height)
    instance_create(-32, Height, Monster)
    }
    
if Direction = 2 or Direction = 3 or Direction = 1
    {
    Width = random_range(200, room_width-200)
    instance_create(Width, room_height + 32, Monster)
    }
    
if Direction = 4
    {
    Height = random_range(288, room_height)
    instance_create(room_width + 32, Height, Monster)
    }
    
if image_index != 11
alarm[0] = MonsterRate
}

