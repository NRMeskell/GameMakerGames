/// @description Vars

FoodReady = false

AtHome = false
ToDragon = 0

Level = 1
MineHealth = 20

MyTag = instance_create(room_width/2, room_height - 25, WorkerTag)

with MyTag
    MyThing = other

MySound = audio_play_sound(Hammering, 1, 0)

audio_stop_sound(MySound)

Resource = 0
HaveResource = "None"

//Upgrade/Select
Selected = false
MenuSize = 1.5
Edge = 5
CaptionPlace = 21
UpgradePlace = 38

MyThing = instance_create(x,y,Selectable)

with MyThing
    {
    MyThing = other
    mask_index = MyThing.mask_index
    }

image_speed = 0
health = 5
Spd = 0.75
Task = "None"
Working = false

alarm[0] = 10
    
MyHouse = instance_nearest(x, y+1, MonsterTarget)

Target = MyHouse

