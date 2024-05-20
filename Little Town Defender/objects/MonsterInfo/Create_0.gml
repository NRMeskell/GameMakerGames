/// @description Created Vars

image_speed = 0

if image_index = 0
    {
    MonsterRate = 540 + TownHall.Level * 180
    Monster = Goblin
    Name = "Goblin"
    Damage = global.GoblinDam
    Spd = global.GoblinSpd * 10
    Health = global.GoblinHealth
    
    Specialty = "None"
    }

with MonsterInfo
    y -= sprite_height + 10

Selected = false

Edge = 5

image_xscale = 0.8
image_yscale = 0.8

alarm[0] = 1

audio_play_sound(EnemyArrive, 3, false)


