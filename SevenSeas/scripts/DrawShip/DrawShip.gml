/// @description  @description DrawShip(hull sprite, sprite index, x, y, angle, color, flag_sprite, flag_color, layer)
/// @param hull sprite
/// @param  sprite index
/// @param  x
/// @param  y
/// @param  angle
/// @param  color
/// @param  flag_sprite
/// @param  flag_color
/// @param  layer
function DrawShip(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8) {


	var myFlagX = 0
	var myFlagY = 0
	var rotation = round(argument4*4)/4
	var xPos = argument2
	var yPos = argument3
	
	var red = 0.03, green = 0.03, blue = 0.01;
	if argument0 == TropicalShipSpr or argument0 == FrogKingShipSpr or argument0 == FrogShipRoyalSpr{
		red = 0.01; green = 0.05; blue = 0.02;
	}else if argument0 == SkeletalShipSpr or argument0 == SpiritLordShipSpr{
		red = 0.015; green = 0.00; blue = 0.02;
	}
	
		
	var slices = sprite_get_nineslice(argument0);
	slices.active = false;
	myFlagX = sprite_get_xoffset(argument0)-(sprite_get_width(argument0)-slices.right);
	myFlagY =  slices.top-sprite_get_yoffset(argument0);

	var myLightXOffset = sprite_get_xoffset(argument0)-slices.left;
	var myLightYOffset = (sprite_get_height(argument0)-slices.bottom-2)-sprite_get_yoffset(argument0);

	var myLightX; 
	var myLightY;
	myLightX[0] = getRotPosX(xPos, yPos, myLightXOffset, myLightYOffset, rotation);
	myLightY[0] = getRotPosY(xPos, yPos, myLightXOffset, myLightYOffset - 1, rotation);

	var j=1;
	for(var i=sprite_get_width(argument0)-slices.right; i>slices.left + 20; i-=20){
		myLightX[j] = getRotPosX(xPos, yPos, sprite_get_xoffset(argument0) - i, (sprite_get_height(argument0)-slices.bottom)-sprite_get_yoffset(argument0), rotation);
		myLightY[j] = getRotPosY(xPos, yPos, sprite_get_xoffset(argument0) - i, (sprite_get_height(argument0)-slices.bottom)-sprite_get_yoffset(argument0), rotation) + 6 - j*2;
		j+=1;
	}
	
	var myLight;
	for(var i=0; i<array_length(myLightX); i++){
		myLight[i] = instance_create(myLightX[i], myLightY[i], LightParent)   
		myLight[i].red = red
		myLight[i].green = green
		myLight[i].blue = blue
		myLight[i].myVolume = (i==0 ? 4 : 7)
		myLight[i].lightLayer = argument8
		with myLight[i]
			event_user(1)
	}

	DrawWithLighting(argument6, Ship.animate/(2+global.inPort), getRotPosX(xPos, yPos, myFlagX, myFlagY - 10, rotation)+1, getRotPosY(xPos, yPos, myFlagX, myFlagY-10, rotation), 0, merge_color(argument5, merge_color(c_white, Clock.cloudColor, 0.6), 0.5), 1, argument8)
	DrawWithLighting(FlagPostSpr, Ship.animate/(2+global.inPort), getRotPosX(xPos, yPos, myFlagX, myFlagY, rotation), getRotPosY(xPos, yPos, myFlagX, myFlagY, rotation), rotation, merge_color(argument5, merge_color(c_white, Clock.cloudColor, 0.6), 0.5), 1, argument8)
	DrawWithLighting(argument0, argument1, xPos, yPos, rotation, merge_color(argument5, merge_color(c_white, Clock.cloudColor, 0.6), 0.5), 1, argument8)
	
	for(var i=0; i<array_length(myLightX); i++){
		DrawWithLighting(LanternSpr, i==0, myLightX[i], myLightY[i], i==0 ? rotation : 0, merge_color(argument5, merge_color(c_white, Clock.cloudColor, 0.6), 0.5), 1, argument8)
		instance_destroy(myLight[i])
	}
}

function getRotPosX(xPos, yPos, xoffset, yoffset, rot){
	return xPos - (xoffset*dcos(rot) - yoffset*dsin(rot));
}

function getRotPosY(xPos, yPos, xoffset, yoffset, rot){
	return yPos + xoffset*dsin(rot) + yoffset*dcos(rot);
}