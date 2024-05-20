/// @description StartDriving

driveDirection = choose(-1,1)
driveSpeed = 10
image_index = irandom(image_number-1)
image_speed = 0

if driveDirection = -1
    {
    drivePath = path_start(CarPathLeft, driveSpeed*sqrt(global.timeDiff), path_action_stop, true)
    }
else
    drivePath = path_start(CarPathRight, driveSpeed*sqrt(global.timeDiff), path_action_stop, true)
    
if BridgeBridge.y != BridgeBridge.minLevel
    instance_destroy()
else
    {
    horn = audio_play_sound(CarHornSound, 1, false)
    audio_sound_gain(horn, 0.2, 0)
    }

