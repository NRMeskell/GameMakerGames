/// @description Draw sparkles


if team != "pirate"{
	animation += animationSpeed
	if animation > sprite_get_number(CombatEffectSpr)-1
	    animation = 0

	for(i=0; i<sparkleNumber; i++)
	    {
	    if effect == "damageMultiplier"
	    {
	    if attackType = "melee"
	        sparkleColor = make_color_rgb(148, 148, 148)
	    else if attackType = "ranged"
	        sparkleColor = make_color_rgb(158, 126, 2)
	    else if attackType = "cannon"
	        sparkleColor = make_color_rgb(180, 0, 0)
	    else if attackType = "ship"
	        sparkleColor = make_color_rgb(0, 73, 165)
	    else 
	        {
	        sparkleColors[0] = make_color_rgb(158, 126, 2)
	        sparkleColors[1] = make_color_rgb(128, 128, 128)
	        sparkleColors[2] = make_color_rgb(180, 0, 0)
	        sparkleColors[3] = make_color_rgb(0, 73, 165)
	        sparkleColor = sparkleColors[sparkleX[i] mod 4]
	        }
	    }
    
	    draw_sprite_ext(CombatEffectSpr, animation + sparkleChange[i], sparkleX[i], sparkleY[i], 1, 1, 0, sparkleColor, 0.8)
	    if sparkleChange[i] == animation
	        {
	        event_user(2)
	        }
	    }
	}



