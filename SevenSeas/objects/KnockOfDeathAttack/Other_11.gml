/// @description Do attack

cursedPirates = 0
damage = 0
with Pirate{
	if body == sprite_get_number(PirateManSkinSpr)-1{
		other.cursedPirates += 1
		myHealth = myHealth div 2 + 1
		damage += myHealth
	}
}

//if not all pirates are cursed
if cursedPirates < instance_number(Pirate){
	cursePirate = RandomPirate()
	while cursePirate.body == sprite_get_number(PirateManSkinSpr)-1
		cursePirate = RandomPirate()
		
	global.moraleBoost = "skeleton" 
	with cursePirate{
		body = sprite_get_number(PirateManSkinSpr)-1
		face = sprite_get_number(PirateManFaceSpr)-1
		UpdateMorale(-5, -1)
		UpdateMorale(3, global.DARING)
			
		if surface_exists(fullPirateSurface)
			MakePirateSurface(fullPirateSurface, 0, 0)
		if surface_exists(smallPirateSurface)
			MakePirateSurface(smallPirateSurface, drawPictureRealx, drawPictureRealy)
		if surface_exists(tagPirateSurface)
			MakePirateSurface(tagPirateSurface, drawTagSpriteX, drawTagSpriteY)
	}
}


