/// @description Knock Over

if phy_speed > 0.5
    with other.myCharacter
        {
		bigHit = other.super
        stunned = true
        alarm[5] = (1+bigHit)* room_speed * 3/global.timeDiff
        audio_play_sound(BowlingPinSound, 1, false)
        with body
            {
            physics_apply_impulse(x,y,0,-(0.2+0.3*other.bigHit)*sqrt(global.timeDiff))
			physics_apply_angular_impulse(choose(-1,1)*(2+3*other.bigHit)*sqrt(global.timeDiff))
            }
        }

