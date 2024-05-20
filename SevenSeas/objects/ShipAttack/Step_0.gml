/// @description Move Ship

if changeZones == true
    {
    if alarm[4] > 0
        {
        actualMoveSpeed = CombatRunner.closeDistance/((room_speed*2)/moveSpeed)
        
        if CombatRunner.closeRange
            {
            CombatRunner.currentDistance += actualMoveSpeed
            Ship.middleWaves.waveOffsets[0] += actualMoveSpeed
            Ship.backWaves.waveOffsets[0] += actualMoveSpeed/2
            Ship.frontWaves.waveOffsets[0] += actualMoveSpeed*1.25
            }
        else
            {
            CombatRunner.currentDistance -= actualMoveSpeed
            Ship.middleWaves.waveOffsets[0] -= actualMoveSpeed
            Ship.backWaves.waveOffsets[0] -= actualMoveSpeed/2
            Ship.frontWaves.waveOffsets[0] -= actualMoveSpeed*1.25
            }
        }
    }

