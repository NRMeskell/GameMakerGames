/// @description Draw Chracter

//dodgeball arrow (golf below)
if throwing{
    draw_sprite_ext(ArrowSpr, 0, body.x, body.y, 1, 1, -90 + ((90+(throwAngle)) + 2*((1-facingRight))*-(90+throwAngle)), CharacterCreator.characterColors[playerNumber], 1)
    }

draw_sprite_ext(BodySkinSpr, 0, body.x, body.y, -1+2*facingRight, 1, -body.phy_rotation, merge_color(mySkinColor, c_dkgray, min((body.alarm[0]+1)/room_speed, 1)), 1)
draw_sprite_ext(BodySpr, myShirtType, body.x, body.y, -1+2*facingRight, 1, -body.phy_rotation, merge_color(c_white, c_dkgray, min((body.alarm[0]+1)/room_speed, 1)), 1)
draw_sprite_ext(HeadSpr, myHeadType, head.x, head.y, -1+2*facingRight, 1, -head.phy_rotation, merge_color(c_white, c_dkgray, min((head.alarm[0]+1)/room_speed, 1)), 1)

draw_sprite_ext(LegSkinSpr, 0, leg1.x, leg1.y, -(-1+2*facingRight), 1, -leg1.phy_rotation, merge_color(mySkinColor, c_dkgray, min((leg1.alarm[0]+1)/room_speed, 1)), 1)
draw_sprite_ext(LegSpr, myPantsType, leg1.x, leg1.y, -(-1+2*facingRight), 1, -leg1.phy_rotation, merge_color(c_white, c_dkgray, min((leg1.alarm[0]+1)/room_speed, 1)), 1)
draw_sprite_ext(LegSkinSpr, 0, leg2.x, leg2.y, -1+2*facingRight, 1, -leg2.phy_rotation, merge_color(mySkinColor, c_dkgray, min((leg2.alarm[0]+1)/room_speed, 1)), 1)
draw_sprite_ext(LegSpr, myPantsType, leg2.x, leg2.y, -1+2*facingRight, 1, -leg2.phy_rotation, merge_color(c_white, c_dkgray, min((leg2.alarm[0]+1)/room_speed, 1)), 1)

draw_sprite_ext(FootSkinSpr, 0, foot1.x, foot1.y, -(-1+2*facingRight), 1, -foot1.phy_rotation, merge_color(mySkinColor, c_dkgray, min((foot1.alarm[0]+1)/room_speed, 1)), 1)
draw_sprite_ext(FootSpr, myPantsType, foot1.x, foot1.y, -(-1+2*facingRight), 1, -foot1.phy_rotation, merge_color(c_white, c_dkgray, min((foot1.alarm[0]+1)/room_speed, 1)), 1)
draw_sprite_ext(FootSkinSpr, 0, foot2.x, foot2.y, -1+2*facingRight, 1, -foot2.phy_rotation, merge_color(mySkinColor, c_dkgray, min((foot2.alarm[0]+1)/room_speed, 1)), 1)
draw_sprite_ext(FootSpr, myPantsType, foot2.x, foot2.y, -1+2*facingRight, 1, -foot2.phy_rotation, merge_color(c_white, c_dkgray, min((foot2.alarm[0]+1)/room_speed, 1)), 1)

draw_sprite_ext(ArmSkinSpr, 0, arm1.x, arm1.y, 1, -(-1+2*facingRight), -arm1.phy_rotation, merge_color(mySkinColor, c_dkgray, min((arm1.alarm[0]+1)/room_speed, 1)), 1)
draw_sprite_ext(ArmSpr, myShirtType, arm1.x, arm1.y, 1, -(-1+2*facingRight), -arm1.phy_rotation, merge_color(c_white, c_dkgray, min((arm1.alarm[0]+1)/room_speed, 1)), 1)
draw_sprite_ext(ArmSkinSpr, 0, arm2.x, arm2.y, 1, -1+2*facingRight, -arm2.phy_rotation, merge_color(mySkinColor, c_dkgray, min((arm2.alarm[0]+1)/room_speed, 1)), 1)
draw_sprite_ext(ArmSpr, myShirtType, arm2.x, arm2.y, 1, -1+2*facingRight, -arm2.phy_rotation, merge_color(c_white, c_dkgray, min((arm2.alarm[0]+1)/room_speed, 1)), 1)

draw_sprite_ext(HandSkinSpr, 0, hand1.x, hand1.y, 1, -(-1+2*facingRight), -hand1.phy_rotation, merge_color(mySkinColor, c_dkgray, min((hand1.alarm[0]+1)/room_speed, 1)), 1)
draw_sprite_ext(HandSpr, myShirtType, hand1.x, hand1.y, 1, -(-1+2*facingRight), -hand1.phy_rotation, merge_color(c_white, c_dkgray, min((hand1.alarm[0]+1)/room_speed, 1)), 1)
draw_sprite_ext(HandSkinSpr, 0, hand2.x, hand2.y, 1, -1+2*facingRight, -hand2.phy_rotation, merge_color(mySkinColor, c_dkgray, min((hand2.alarm[0]+1)/room_speed, 1)), 1)
draw_sprite_ext(HandSpr, myShirtType, hand2.x, hand2.y, 1, -1+2*facingRight, -hand2.phy_rotation, merge_color(c_white, c_dkgray, min((hand2.alarm[0]+1)/room_speed, 1)), 1)

if stunned
    {
    draw_sprite_ext(StunnedRingsSpr, 0, head.x, head.y - 10, -1, 1, 0, c_white, 1)
    draw_sprite_ext(StunnedRingsSpr, 0, head.x, head.y - 10, 1, 1, 0, c_white, 1)
    }

if sticky
    {
    draw_sprite_ext(StickyBodySpr, 0, body.x, body.y, -1+2*facingRight, 1, -body.phy_rotation, c_white, 1)
    draw_sprite_ext(StickyArmSpr, 0, arm1.x, arm1.y, 1, 1, -arm1.phy_rotation, c_white, 1)
    draw_sprite_ext(StickyArmSpr, 0, arm2.x, arm2.y, 1, 1, -arm2.phy_rotation, c_white, 1)
    draw_sprite_ext(StickyHandSpr, 0, hand1.x, hand1.y, 1, 1, -hand1.phy_rotation, c_white, 1)
    draw_sprite_ext(StickyHandSpr, 0, hand2.x, hand2.y, 1, 1, -hand2.phy_rotation, c_white, 1)
    }    
    
if handBall[0] > -1
    {
	if handSuper[0] != false {
		for(var i=0; i<360; i+=360/6){
			draw_sprite_ext(SuperRaySpr, 0, hand1.x, hand1.y, 1 + 0.2*dsin(current_time/20), 1, i+current_time/10, c_white, 1)
		}
	}	
    draw_sprite_ext(DodgeBallSpr, handBall[0], hand1.x, hand1.y, 1 + handSuper[0]*(handBall[0]==10), 1+ handSuper[0]*(handBall[0]==10), 90, c_white, 1)
    if sticky
        draw_sprite(StickyBallSpr, 0, hand1.x, hand1.y)
    }
    
if handBall[1] > -1
    {
	if handSuper[1] != false {
		for(var i=0; i<360; i+=360/6){
			draw_sprite_ext(SuperRaySpr, 0, hand2.x, hand2.y, 1 + 0.2*dsin(current_time/20), 1, i+current_time/10, c_white, 1)
		}
	}	
    draw_sprite_ext(DodgeBallSpr, handBall[1], hand2.x, hand2.y, 1 + handSuper[1]*(handBall[1]==10), 1 + handSuper[1]*(handBall[1]==10), 90, c_white, 1)
    if sticky
        draw_sprite(StickyBallSpr, 0, hand2.x, hand2.y)
    }
    



