/// @description next room

    
if global.gameMode == "dodgeball"{
    global.loopBreaker = 0
    i = irandom(ds_list_size(StageList.stageList) - 1)
    if ds_list_size(StageList.stageList) > 1
        while (i == lastStage and global.loopBreaker < 100){
            i = irandom(ds_list_size(StageList.stageList) - 1)
            global.loopBreaker ++
            }
        
    lastStage = i
    
    for(r = 0; r < ds_list_size(scores); r++)
        {
        if gamemode = gamemodes[0]
            ds_list_replace(scores, r, startingScore)
        else
            ds_list_replace(scores, r, 0)
        }
        
    if gamemode == gamemodes[2]
        alarm[2] = startingScore*3600//global.timeDiff
        
    event_user(2)
    room_goto(ds_list_find_value(StageList.stageList, i))
    alarm[0] = 5
    }
else if global.gameMode == "golf"{
    if instance_exists(LastHole){
        event_user(2)
        room_goto(GolfMenuRoom)
        }
    else{
        event_user(2)
        for(i=0; i<ds_list_size(scores); i++)
            ds_list_replace(scores, i, 0)
        alarm[2] = -1//global.timeDiff
        room_goto_next()
        alarm[0] = 5
        golfHoleNumber ++
        }
    }
    
gameOver = false


