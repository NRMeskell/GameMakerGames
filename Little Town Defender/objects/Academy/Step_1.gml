/// @description Change Worker Stages

if global.WorkerStage = 1
if global.WorkersAtHouse = instance_number(Worker)
    {
    global.WorkerStage = 2
    with Worker
        sprite_index = WarriorSpr
    }
    
if global.WorkerStage = 2
if !instance_exists(Enemy)
    {
    global.WorkerStage = 3
    }
    
if global.WorkerStage = 3
if global.WorkersAtHouse = instance_number(Worker)
    {
    alarm[8] = 5
    global.WorkerStage = 4
    
    with Worker
        VictoryWalk = 0
    } 
    

