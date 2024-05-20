/// @description Walk Out Workers

NextWorker = instance_find(Worker, wr)

with NextWorker
    {
    WalkSpr = WarriorSpr
    ToDragon = 1
    
    if other.wr = (((instance_number(Worker)) * 0.25) div 1) or other.wr = (((instance_number(Worker)) * 0.75) div 1)
        WalkSpr = WarriorFlagSm
        
    if other.wr = (((instance_number(Worker)) * 0.5) div 1)
        WalkSpr = WarriorFlagLg
    }
    
wr ++
alarm[8] = 60


