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
	rotation = round(argument4*4)/4
	xPos = global.modernRes ? argument2 : argument2 div 1
	yPos = global.modernRes ? argument3 : argument3 div 1

	if argument0 == ShipSloopSpr{
	    myFlagX = sprite_get_xoffset(argument0)-40
	    myFlagY = 1-sprite_get_yoffset(argument0)}
	else if argument0 == ShipScoonerSpr{
	    myFlagX = sprite_get_xoffset(argument0)-43
	    myFlagY = 2-sprite_get_yoffset(argument0)}
	else if argument0 == ShipCaravelSpr{
	    myFlagX = sprite_get_xoffset(argument0)-32
	    myFlagY = 8-sprite_get_yoffset(argument0)}
	else if argument0 == ShipBrigSpr{
	    myFlagX = sprite_get_xoffset(argument0)-41
	    myFlagY = 1-sprite_get_yoffset(argument0)}
	else if argument0 == MerchantSmallSpr{
	    myFlagX = sprite_get_xoffset(argument0)-40
	    myFlagY = 0-sprite_get_yoffset(argument0)}
	else if argument0 == MerchantMediumSpr{
	    myFlagX = sprite_get_xoffset(argument0)-32
	    myFlagY = 0-sprite_get_yoffset(argument0)}
	else if argument0 == MerchantLargeSpr{
	    myFlagX = sprite_get_xoffset(argument0)-40
	    myFlagY = 6-sprite_get_yoffset(argument0)}
	else if argument0 == TropicalShipSpr or argument0 == FrogShipRoyalSpr or argument0 == FrogKingShipSpr{
	    myFlagX = sprite_get_xoffset(argument0)-55
	    myFlagY = 13-sprite_get_yoffset(argument0)}
	else if argument0 == TropicalSwordShipSpr{
	    myFlagX = sprite_get_xoffset(argument0)-55
	    myFlagY = 13-sprite_get_yoffset(argument0)}
	else if argument0 == PirateCollectorsSpr{
	    myFlagX = 14
	    myFlagY = 25-96}
	else if argument0 == SilverwheelShipSpr{
	    myFlagX = 75-65
	    myFlagY = 29-96}
	else if argument0 == ScavengerShipSpr{
	    myFlagX = 0
	    myFlagY = 25-96}
	else if argument0 == SkeletalShipSpr{
	    myFlagX = sprite_get_xoffset(argument0)-76
	    myFlagY = 30-sprite_get_yoffset(argument0)}

	myLightX = xPos - (myFlagX*dcos(rotation) - myFlagY*dsin(rotation))/3
	myLightY = yPos + (myFlagX*dsin(rotation) + myFlagY*dcos(rotation))/3
    

	myLight = instance_create(myLightX, myLightY, LightParent)   
	myLight.red = 0.03
	myLight.green = 0.03
	myLight.blue = 0.01
	myLight.flicker = true
	if true //(SunLight.myVolume < 500)
	    myLight.myVolume = 7
	else
	    myLight.myVolume = 0
	myLight.lightLayer = argument8
	with myLight
	    event_user(1)

	DrawWithLighting(argument6, Ship.animate/(2+global.inPort), xPos - (myFlagX*dcos(rotation) - myFlagY*dsin(rotation)), yPos + myFlagX*dsin(rotation) + myFlagY*dcos(rotation), rotation, merge_color(argument5, merge_color(c_white, Clock.cloudColor, 0.6), 0.5), 1, argument8)
	DrawWithLighting(argument0, argument1, xPos, yPos, rotation, merge_color(argument5, merge_color(c_white, Clock.cloudColor, 0.6), 0.5), 1, argument8)

	instance_destroy(myLight)
}
