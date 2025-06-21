/// @description Event difficulty
//easy = 0; medium = 1; hard = 2; very hard = 3
//number of pirates per level: 3, 4, 6

    
levelDiff[0] = 1 + global.eventDiffBase
levelDiff[1] = 2 + global.eventDiffBase
levelDiff[2] = 3 + global.eventDiffBase
levelDiff[3] = 5 + global.eventDiffBase

//rigging
global.eventDiff[3, 0] = (power(global.seaLevel+1, 0.6) * levelDiff[0])
global.eventDiff[3, 1] = (power(global.seaLevel+1, 0.6) * levelDiff[1])
global.eventDiff[3, 2] = (power(global.seaLevel+1, 0.6) * levelDiff[2])
global.eventDiff[3, 3] = (power(global.seaLevel+1, 0.6) * levelDiff[3])

//Wheel
global.eventDiff[5, 0] = power((global.seaLevel+1) * levelDiff[0], 0.6)
global.eventDiff[5, 1] = power((global.seaLevel+1) * levelDiff[1], 0.6)
global.eventDiff[5, 2] = power((global.seaLevel+1) * levelDiff[2], 0.6)
global.eventDiff[5, 3] = power((global.seaLevel+1) * levelDiff[3], 0.6)

//Medical
global.eventDiff[6, 0] = power((global.seaLevel+1) * levelDiff[0], 0.6)
global.eventDiff[6, 1] = power((global.seaLevel+1) * levelDiff[1], 0.6)
global.eventDiff[6, 2] = power((global.seaLevel+1) * levelDiff[2], 0.6)
global.eventDiff[6, 3] = power((global.seaLevel+1) * levelDiff[3], 0.6)


