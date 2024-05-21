///@description Draw on ship

var __b__;
__b__ = action_if_variable(showReal, true, 0);
if __b__
{
{
///Draw Real Pirate 
if (Ship.portSelect = true or global.inPort = false)
    {
    DrawPiratePart(xReal, yReal, drawPictureRealx, drawPictureRealy+1, realWidth, realHeight)
        
    draw_sprite(PirateInjuredTimerBackSpr, 0, xReal-1, yReal-1)
	if myHealth <= healthDiff{
	    draw_sprite_ext(PirateInjuredTimerSpr, max(0, -1+sprite_get_number(PirateInjuredTimerSpr)*healthDiff/maxHealth), xReal-1, yReal-1-(healed>0), 1, 1, 0, c_red, 1)
	    draw_sprite_ext(PirateInjuredTimerSpr, max(0, -1+sprite_get_number(PirateInjuredTimerSpr)*myHealth/maxHealth), xReal-1, yReal-1-(healed>0), 1, 1, 0, c_yellow, 1)
	}else{
		draw_sprite_ext(PirateInjuredTimerSpr, max(0, -1+sprite_get_number(PirateInjuredTimerSpr)*myHealth/maxHealth), xReal-1, yReal-1-(healed>0), 1, 1, 0, c_lime, 1)
	    draw_sprite_ext(PirateInjuredTimerSpr, max(0, -1+sprite_get_number(PirateInjuredTimerSpr)*healthDiff/maxHealth), xReal-1, yReal-1-(healed>0), 1, 1, 0, c_yellow, 1)
	}
	if healed > 0{
		draw_sprite_ext(PirateInjuredTimerSpr, -1+sprite_get_number(PirateInjuredTimerSpr), xReal-1, yReal, 1, 1, 0, c_gray, 1)
		draw_sprite_ext(PirateInjuredTimerSpr, max(0, -1+sprite_get_number(PirateInjuredTimerSpr)*healed), xReal-1, yReal, 1, 1, 0, c_lime, 1)
	}
	
	
    if injured
            draw_sprite(PirateInjuredSpr, 0, xReal + 28, yReal -2)
    
    if stunned
        draw_sprite(PirateInjuredSpr, 3, xReal + 28, yReal - 2)
    else if bleeding
        draw_sprite(PirateInjuredSpr, 2, xReal + 28, yReal - 2)
    else if exposed
        draw_sprite(PirateInjuredSpr, 4, xReal + 28, yReal - 2)
    else if injured
        draw_sprite(PirateInjuredSpr, 1, xReal + 28, yReal - 2)
    }

}
}
