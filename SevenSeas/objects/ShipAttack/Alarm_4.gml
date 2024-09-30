/// @description Animate

if instance_exists(CombatRunner){
	if myShipTarget = Ship
		{
		image_xscale = 1
		x = Ship.drawX + irandom_range(-animationWidth,animationWidth)
		y = Ship.drawY + animationY + irandom_range(-animationHeight,animationHeight) + Ship.waveHeight
		}
	else
		{
		x = CombatRunner.placeX - 20*CombatRunner.closeRange + irandom_range(-animationWidth,animationWidth)
		y = CombatRunner.placeY + animationY + irandom_range(-animationHeight,animationHeight) + Ship.waveHeight
		image_xscale = -1
		}
    
	image_index = 0
	//image_yscale = choose(-1,1)

	if hasAnimation
		with instance_create(x,y,AttackAnimation)
		    {
		    image_xscale = other.image_xscale
		    image_yscale = other.image_yscale
		    image_speed = other.image_speed
		    sprite_index = other.sprite_index
		    image_blend = other.image_blend
		    image_angle = other.image_angle
			if other.myAnimationSound != undefined and other.myAnimationSound != noone{
			    myActualAnimationSound = audio_play_sound(other.myAnimationSound, 1, false)
			    audio_sound_pitch(myActualAnimationSound, random_range(other.lowRange, other.highRange))
			}
			lightType = "ship"
		}

	event_user(3)
	event_user(1)
	if hasAnimation
		alarm[0] = image_number/image_speed + room_speed*2
	else
		alarm[0] = room_speed
    if instance_exists(CombatRunner){
		if CombatRunner.closeRange
			CombatRunner.currentDistance = CombatRunner.closeDistance
		else
			CombatRunner.currentDistance = 0
	}
}
