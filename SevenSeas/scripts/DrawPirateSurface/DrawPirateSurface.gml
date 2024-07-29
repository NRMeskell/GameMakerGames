// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

/// @function DrawPirateSurface(surface, x, y)
function DrawPirateSurface(surfaceTarget, argument0, argument1){
	draw_surface_ext(surfaceTarget, argument0+1, argument1, 1, 1, 0, c_black, 0.5)
	draw_surface_ext(surfaceTarget, argument0-1, argument1, 1, 1, 0, c_black, 0.5)
	draw_surface_ext(surfaceTarget, argument0, argument1+1, 1, 1, 0, c_black, 0.5)
	draw_surface_ext(surfaceTarget, argument0, argument1-1, 1, 1, 0, c_black, 0.5)
	draw_surface(surfaceTarget, argument0, argument1)
}

/// @function DrawItem(sprite, index, color, x, y, left, top, width, height)
function DrawItem(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8){
	red = color_get_red(argument2)/255
	green = color_get_green(argument2)/255
	blue = color_get_blue(argument2)/255
	
	shader_set(ItemShader)
	uni_red = shader_get_uniform(ItemShader, "red")
	uni_green = shader_get_uniform(ItemShader, "green")
	uni_blue = shader_get_uniform(ItemShader, "blue")
	shader_set_uniform_f(uni_red, red)
	shader_set_uniform_f(uni_green, green)
	shader_set_uniform_f(uni_blue, blue)
	
	draw_sprite_part(argument0, argument1, argument5, argument6, argument7, argument8, argument3, argument4)
	shader_reset()
	
}

/// @function MakePirateSurface(surface, left, top)
function MakePirateSurface(pirateSurface, left, top){
	var surWidth = surface_get_width(pirateSurface),
		surHeight = surface_get_height(pirateSurface);
		
	surface_set_target(pirateSurface);
	draw_clear_alpha(c_black,0);
	
	//draw body
	draw_sprite_part_ext(mySkin, body, left, top, min(sprite_get_width(mySkin)/2 - left, surWidth), min((76 + !legLostRight*21) - top, surHeight), 0, 0, size, size, skinColor, 1)
	draw_sprite_part_ext(mySkin, body, max(left, sprite_get_width(mySkin)/2), top, (left + surWidth) - sprite_get_width(mySkin)/2, min((76 + !legLostLeft*21) - top, surHeight), max(0,sprite_get_width(PirateManSkinSpr)/2-left), 0, size, size, skinColor, 1)
	draw_sprite_part_ext(myFace, face, left, top, surWidth, surHeight, 0, 0, size, size, skinColor, 1)
   
	if myPants.itemName != "none"{
	    DrawItem(PiratePantsSpr, myPants.itemNumber, myPants.myColor, 0, 0, left, top, min(sprite_get_width(mySkin)/2 - left, surWidth), min((76 + !legLostRight*21) - top, surHeight))
		DrawItem(PiratePantsSpr, myPants.itemNumber, myPants.myColor,  0+max(0,sprite_get_width(PirateManSkinSpr)/2-left), 0, max(left, sprite_get_width(mySkin)/2), top, (left + surWidth) - sprite_get_width(mySkin)/2, min((76 + !legLostLeft*21) - top, surHeight))
		}

	if legLostLeft
	    DrawItem(PiratePegLegsSpr, 1, c_white, 0, 0, left, top, surWidth, surHeight)
	if legLostRight
	    DrawItem(PiratePegLegsSpr, 0, c_white, 0, 0, left, top, surWidth, surHeight)    
    
	if myShirt.itemName != "none"
	    {
		DrawItem(PirateShirtSpr, myShirt.itemNumber, myShirt.myColor, 0, 0, left, top, surWidth, surHeight)
	    }
    
	if eyeLostRight = true
	    draw_sprite_part_ext(PiratePatchSpr, 0, left, top, surWidth, surHeight, 0, 0, size, size, c_white, 1)
	if eyeLostLeft = true
	    draw_sprite_part_ext(PiratePatchSpr, 1, left, top, surWidth, surHeight, 0, 0, size, size, c_white, 1)
    
	if myLeftHand.itemName != "none"
	    draw_sprite_part_ext(PirateLeftSpr, myLeftHand.itemNumber, left, top, surWidth, surHeight, 0, 0, size, size, c_white, 1)
	if myRightHand.itemName != "none"
	    draw_sprite_part_ext(PirateRightSpr, myRightHand.itemNumber, left, top, surWidth, surHeight, 0, 0, size, size, c_white, 1)

	if handLostRight = true    
	    draw_sprite_part_ext(PirateHookSpr, 0, left, top, surWidth, surHeight, 0, 0, size, size, c_white, 1)
	if handLostLeft = true    
	    draw_sprite_part_ext(PirateHookSpr, 1, left, top, surWidth, surHeight, 0, 0, size, size, c_white, 1)

	draw_sprite_part_ext(PirateHairSpr, hair, left, top, surWidth, surHeight, 0, 0, size, size, hairColor, 1)    
	draw_sprite_part_ext(PirateBeardSpr, beard, left, top, surWidth, surHeight, 0, 0, size, size, hairColor, 1)

	if myHat.itemName != "none"
	    DrawItem(PirateHatSpr, myHat.itemNumber, myHat.myColor, 0, 0, left, top, surWidth, surHeight)

	if myPet.itemName != "none"
	    DrawItem(PiratePetSpr, myPet.itemNumber, myPet.myColor, 0, 0, left, top, surWidth, surHeight)

	surface_reset_target()
}