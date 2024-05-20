/// @description Count Bloodstones

global.BloodBonus = 0

if instance_exists(Bloodstone)
with Bloodstone
    {
    if image_index = 4
        global.BloodBonus += 0.1
    if image_index = 5
        global.BloodBonus += 0.2
    }

///Money Overload

if global.Gold > 99999
    global.Gold = 99999
    
if global.Trees > 99999
    global.Trees = 99999
    
if global.Rocks > 99999
    global.Rockes = 99999

///Victory

global.WorkerVic = 0

with WorkerTag
    {
    if sprite_index = WorkerTagSpr
        global.WorkerVic += 1
    if sprite_index = WorkerTag2
        global.WorkerVic += 2
    if sprite_index = WorkerTag3
        global.WorkerVic += 3
    }
    
if global.BribedDone = true
if !collision_rectangle(0,0, room_width, room_height, Enemy, false, true)
    {
    global.Victory = true
    }
    
if global.Summoned = true
if !instance_exists(Dragon)
if !instance_exists(DragonDeath)
    {
    global.Victory = true
    }
    
if global.Army = true
if !collision_rectangle(0,0, room_width, room_height, Worker, false, true)
    {
    global.Victory = true
    }
    

