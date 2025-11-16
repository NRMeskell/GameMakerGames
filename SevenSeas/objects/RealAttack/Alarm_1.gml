/// @description Animate

if myShipTarget = Ship
    {
    image_xscale = 1
    x = Ship.drawX + animationX + irandom_range(-animationWidth,animationWidth)
    y = Ship.drawY + animationY + irandom_range(-animationHeight,animationHeight) + Ship.waveHeight
    }
else
    {
    x = CombatRunner.placeX - animationX + irandom_range(-animationWidth,animationWidth)
    y = CombatRunner.placeY + animationY + irandom_range(-animationHeight,animationHeight) + Ship.waveHeight
    image_xscale = -1
    }
    
image_index = 0
image_yscale = choose(-1,1)

madeAttacks--
if madeAttacks < 0
    {
    image_speed = 0
    image_index = 0
    
    event_user(3)
    event_user(1)
    alarm[0] = room_speed * 2
    }
else
    {
    alarm[1] = animationLength/attackNumber
	
	//Change animation
    event_user(2)
	
    with instance_create(x,y,AttackAnimation)
        {
        lightType = other.actionType
        image_xscale = other.image_xscale
        image_yscale = other.image_yscale
        image_speed = other.image_speed
        sprite_index = other.sprite_index
        image_blend = other.image_blend
        image_angle = other.image_angle
        myActualSound = audio_play_sound(other.mySound, 1, false)
        audio_sound_pitch(myActualSound, random_range(other.lowRange, other.highRange))
        }
        
    if singleAttack
        madeAttacks = 0
    }

