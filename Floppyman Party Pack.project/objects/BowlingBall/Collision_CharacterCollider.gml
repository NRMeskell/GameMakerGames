/// @description Knock Over

if phy_speed > 0.5
    with other.myCharacter
        {
        stunned = true
        alarm[5] = room_speed * 3/global.timeDiff
        audio_play_sound(BowlingPinSound, 1, false)
        with body
            {
            physics_apply_impulse(x,y,0,-0.2*sqrt(global.timeDiff))
            }
        }

