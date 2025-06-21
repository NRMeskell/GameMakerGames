// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CursePirate(argument0){
	global.moraleBoost = "cursed" 
	with argument0{
		body = sprite_get_number(PirateManSkinSpr)-1
		face = sprite_get_number(PirateManFaceSpr)-1
		UpdateMorale(-3, -1)
		UpdateMorale(1, global.DARING)
			
		if surface_exists(fullPirateSurface)
			MakePirateSurface(fullPirateSurface, 0, 0)
		if surface_exists(smallPirateSurface)
			MakePirateSurface(smallPirateSurface, drawPictureRealx, drawPictureRealy)
		if surface_exists(tagPirateSurface)
			MakePirateSurface(tagPirateSurface, drawTagSpriteX, drawTagSpriteY)
	}
}

function LiftCurses(){
	var cursesLifted = 0
	global.moraleBoost = "curse lift" 
	for(var i=0; i<instance_number(Pirate); i++){
		var checkPirate = instance_find(Pirate, i)
		if checkPirate.body == sprite_get_number(PirateManSkinSpr) -1{
			checkPirate.face = myMainPer * 2 + irandom(1)
			checkPirate.body = irandom(sprite_get_number(PirateManSkinSpr)-2)
			cursesLifted ++;
			with checkPirate{
				UpdateMorale(3, -1)
				if surface_exists(fullPirateSurface)
					MakePirateSurface(fullPirateSurface, 0, 0)
				if surface_exists(smallPirateSurface)
					MakePirateSurface(smallPirateSurface, drawPictureRealx, drawPictureRealy)
				if surface_exists(tagPirateSurface)
					MakePirateSurface(tagPirateSurface, drawTagSpriteX, drawTagSpriteY)
			}
		}
		if string_starts_with(checkPirate.myShirt.itemName, "Cursed"){
			checkPirate.myShirt.itemName = "Skeletal Coat"
			checkPirate.myShirt.itemInfo = "A beautiful coat, now restored to it's former glory"
			cursesLifted ++;
			with checkPirate
				UpdateMorale(1, -1)
		}
		if string_starts_with(checkPirate.myHat.itemName, "Cursed"){
			checkPirate.myHat.itemName = "Skeletal Hat"
			checkPirate.myHat.itemInfo = "A dark bicorn, now restored to it's former glory"
			cursesLifted ++;
			with checkPirate
				UpdateMorale(1, -1)
		}
		if string_starts_with(checkPirate.myPants.itemName, "Cursed"){
			checkPirate.myPants.itemName = "Skeletal Boots"
			checkPirate.myPants.itemInfo = "mysterious boots, now restored to their former glory"
			cursesLifted ++;
			with checkPirate
				UpdateMorale(1, -1)
		}
	}
	
	return cursesLifted
}
