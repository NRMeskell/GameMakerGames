/// @description Looks
function GeneratePirateLooks() {

	differentHairNumber = 3
	drawable = false

	myGender = choose(0,1)
	if myGender
	    {
	    beardType[0] = choose(0,0,4,3,7)
	    beardType[1] = choose(0,0,2,3,5)
	    beardType[2] = choose(0,0,1,5,7)
	    beardType[3] = choose(0,0,1,5,6)
	    beardType[4] = choose(0,0,2,4,6)
    
	    hairType[0] = choose(0,2,3,4,6)
	    hairType[1] = choose(0,2,3,5,7)
	    hairType[2] = choose(0,1,2,3,5)
	    hairType[3] = choose(0,1,3,5,6)
	    hairType[4] = choose(0,1,5,6,7)
    
	    mySkin = PirateManSkinSpr
	    myFace = PirateManFaceSpr
	    }
	else
	    {
	    beardType[0] = 0
	    beardType[1] = 0
	    beardType[2] = 0
	    beardType[3] = 0
	    beardType[4] = 0
	    mySkin = PirateWomanSkinSpr
	    myFace = PirateWomanFaceSpr
    
	    hairType[0] = choose(4,6,7,3,5)
	    hairType[1] = choose(4,7,8,9,0)
	    hairType[2] = choose(3,4,8,5,6)
	    hairType[3] = choose(1,5,7,9,8)
	    hairType[4] = choose(1,5,3,9,0)
	    }
    
    
	overClosed = false

	size = 1
	xPicture = 38*size
	yPicture = 35*size

	xWindow = room_width*1/2-sprite_get_width(PirateSheetSpr)/2*size + 17
	yWindow = room_height*1/2-sprite_get_height(PirateSheetSpr)/2*size +10

	brown = make_color_rgb(75,35,0)
	black = make_color_rgb(30,30,30)
	blonde = make_color_rgb(145,116,0)
	dkBrown = make_color_rgb(55,27,0)
	gray = make_color_rgb(50,50,50)
	white = make_color_rgb(150,150,150)
	red = make_color_rgb(181,46,0)

	skinDark = random(0.8)
	skinColor = merge_color(c_white, merge_color(c_black, c_red, 0.2), skinDark)

	face = myMainPer * 2 + irandom(1)
	body = irandom(sprite_get_number(PirateManSkinSpr)-2)

	beard = beardType[myMainPer]
	hair = hairType[myMainPer]
    
	hairColor = merge_color(choose(red, black, brown, dkBrown, blonde, gray, white), merge_color(c_black, c_olive, 0.2), skinDark)
}
