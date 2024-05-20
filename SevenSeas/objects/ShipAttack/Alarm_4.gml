/// @description Animate

if hasAnimation
    with instance_create(x,y,AttackAnimation)
        {
        image_xscale = other.image_xscale
        image_yscale = other.image_yscale
        image_speed = other.image_speed
        sprite_index = other.sprite_index
        image_blend = other.image_blend
        image_angle = other.image_angle
        myActualAnimationSound = audio_play_sound(other.myAnimationSound, 1, false)
        audio_sound_pitch(myActualAnimationSound, random_range(other.lowRange, other.highRange))
        lightType = "ship"
        }

event_user(3)
event_user(1)
if hasAnimation
    alarm[0] = image_number/image_speed + room_speed*2
else
    alarm[0] = room_speed/2
    
if CombatRunner.closeRange
    CombatRunner.currentDistance = CombatRunner.closeDistance
else
    CombatRunner.currentDistance = 0

