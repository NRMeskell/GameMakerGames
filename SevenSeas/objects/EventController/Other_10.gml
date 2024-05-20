/// @description Event difficulty
//easy = 0; medium = 1; hard = 2; very hard = 3
//number of pirates per level: 3, 4, 6

    
levelDiff[0] = 1 + global.gameDiff
levelDiff[1] = 2 + global.gameDiff
levelDiff[2] = 4 + global.gameDiff
levelDiff[3] = 6 + global.gameDiff

//rigging
global.eventDiff[3, 0] = ((global.seaLevel+1) * levelDiff[0]) div 1
global.eventDiff[3, 1] = ((global.seaLevel+1) * levelDiff[1]) div 1
global.eventDiff[3, 2] = ((global.seaLevel+1) * levelDiff[2]) div 1
global.eventDiff[3, 3] = ((global.seaLevel+1) * levelDiff[3]) div 1

//Wheel
global.eventDiff[5, 0] = levelDiff[0] + global.seaLevel*2 - 1
global.eventDiff[5, 1] = levelDiff[1] + global.seaLevel*2 - 1
global.eventDiff[5, 2] = levelDiff[2] + global.seaLevel*2 - 1
global.eventDiff[5, 3] = levelDiff[3] + global.seaLevel*2 - 1

//Medical
global.eventDiff[6, 0] = levelDiff[0] + global.seaLevel - 1
global.eventDiff[6, 1] = levelDiff[1] + global.seaLevel - 1
global.eventDiff[6, 2] = levelDiff[2] + global.seaLevel - 1
global.eventDiff[6, 3] = levelDiff[3] + global.seaLevel - 1


