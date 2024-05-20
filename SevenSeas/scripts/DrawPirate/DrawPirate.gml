// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

/// @function DrawPirate(x, y)
function DrawPirate(argument0, argument1){
	DrawPiratePart(argument0, argument1, 0, 0, sprite_get_width(PirateManSkinSpr), sprite_get_height(PirateManSkinSpr))
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

/// @function DrawPiratePart(x, y, left, top, width, height)
function DrawPiratePart(argument0, argument1, argument2, argument3, argument4, argument5){
	pirateSurface = surface_create(argument4, argument5)
	surface_set_target(pirateSurface)
	
	//draw body
	draw_sprite_part_ext(mySkin, body, argument2, argument3, min(sprite_get_width(mySkin)/2 - argument2, argument4), min((76 + !legLostRight*21) - argument3, argument5), 0, 0, size, size, skinColor, 1)
	draw_sprite_part_ext(mySkin, body, max(argument2, sprite_get_width(mySkin)/2), argument3, (argument2 + argument4) - sprite_get_width(mySkin)/2, min((76 + !legLostLeft*21) - argument3, argument5), max(0,sprite_get_width(PirateManSkinSpr)/2-argument2), 0, size, size, skinColor, 1)
	draw_sprite_part_ext(myFace, face, argument2, argument3, argument4, argument5, 0, 0, size, size, skinColor, 1)
   
	if myPants.itemName != "none"{
	    DrawItem(PiratePantsSpr, myPants.itemNumber, myPants.myColor, 0, 0, argument2, argument3, min(sprite_get_width(mySkin)/2 - argument2, argument4), min((76 + !legLostRight*21) - argument3, argument5))
		DrawItem(PiratePantsSpr, myPants.itemNumber, myPants.myColor,  0+max(0,sprite_get_width(PirateManSkinSpr)/2-argument2), 0, max(argument2, sprite_get_width(mySkin)/2), argument3, (argument2 + argument4) - sprite_get_width(mySkin)/2, min((76 + !legLostLeft*21) - argument3, argument5))
		}

	if legLostLeft
	    draw_sprite_part(PiratePegLegsSpr, 1, argument2, argument3, argument4, argument5, 0, 0)
	if legLostRight
	    draw_sprite_part(PiratePegLegsSpr, 0, argument2, argument3, argument4, argument5, 0, 0)    
    
	if myShirt.itemName != "none"
	    {
		DrawItem(PirateShirtSpr, myShirt.itemNumber, myShirt.myColor, 0, 0, argument2, argument3, argument4, argument5)
	    }
    
	if eyeLostRight = true
	    draw_sprite_part_ext(PiratePatchSpr, 0, argument2, argument3, argument4, argument5, 0, 0, size, size, c_white, 1)
	if eyeLostLeft = true
	    draw_sprite_part_ext(PiratePatchSpr, 1, argument2, argument3, argument4, argument5, 0, 0, size, size, c_white, 1)
    
	if myLeftHand.itemName != "none"
	    draw_sprite_part_ext(PirateLeftSpr, myLeftHand.itemNumber, argument2, argument3, argument4, argument5, 0, 0, size, size, c_white, 1)
	if myRightHand.itemName != "none"
	    draw_sprite_part_ext(PirateRightSpr, myRightHand.itemNumber, argument2, argument3, argument4, argument5, 0, 0, size, size, c_white, 1)

	if handLostRight = true    
	    draw_sprite_part_ext(PirateHookSpr, 0, argument2, argument3, argument4, argument5, 0, 0, size, size, c_white, 1)
	if handLostLeft = true    
	    draw_sprite_part_ext(PirateHookSpr, 1, argument2, argument3, argument4, argument5, 0, 0, size, size, c_white, 1)

	draw_sprite_part_ext(PirateHairSpr, hair, argument2, argument3, argument4, argument5, 0, 0, size, size, hairColor, 1)    
	draw_sprite_part_ext(PirateBeardSpr, beard, argument2, argument3, argument4, argument5, 0, 0, size, size, hairColor, 1)

	if myHat.itemName != "none"
	    DrawItem(PirateHatSpr, myHat.itemNumber, myHat.myColor, 0, 0, argument2, argument3, argument4, argument5)

	surface_reset_target()
	
	draw_surface_ext(pirateSurface, argument0-1, argument1, 1, 1, 0, c_dkgray, 1)
	draw_surface_ext(pirateSurface, argument0+1, argument1, 1, 1, 0, c_dkgray, 1)
	draw_surface_ext(pirateSurface, argument0, argument1-1, 1, 1, 0, c_dkgray, 1)
	draw_surface_ext(pirateSurface, argument0+8, argument1, 1, 1, 0, c_black, 0.1)
	draw_surface(pirateSurface, argument0, argument1)
	surface_free(pirateSurface)
}