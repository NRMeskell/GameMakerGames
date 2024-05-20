/// @description Draw Scores

scoreWidth = (display_get_gui_width() * (0.6+0.05*(ds_list_size(scores)-1)))
scoreDistance = scoreWidth/ds_list_size(scores)
scoreStart = display_get_gui_width()/2 - (scoreDistance*(ds_list_size(scores)-1)/2)


if !inMenu
    {
    for(i=0; i<ds_list_size(scores); i++)
        {
        draw_set_color(characterColors[i])
        draw_set_halign(fa_center)
        draw_set_valign(fa_middle)
        draw_set_alpha(0.8)
        draw_text(scoreStart + scoreDistance*i + 15, 25, string_hash_to_newline(string(ds_list_find_value(scores, i))))
        draw_sprite_ext(HeadSpr, ds_list_find_value(headList, i), scoreStart + scoreDistance*i - 15, 27, 1, 1, 0, c_white, 0.8)
        draw_set_alpha(1)
        }
        
    //Draw Timer
    if gamemode == gamemodes[2] or global.gameMode == "golf"
        {
        draw_set_color(c_white)
        draw_set_halign(fa_center)
        draw_set_valign(fa_middle)
        draw_set_alpha(0.8)
		drawTime = alarm[2] + room_speed
        minutes = drawTime div 3600
        seconds = (drawTime - (drawTime div 3600)*3600) div 60
        if alarm[2] > 10*60 or alarm[2] == -1
            {
            var s = string(minutes) + ":" + string(seconds div 10) + string(seconds % 10);
            if alarm[2] > 10*60
                draw_text(display_get_gui_width()/2, display_get_gui_height()-25, string_hash_to_newline(s))
            if global.gameMode == "golf"
                draw_text(display_get_gui_width()/2, display_get_gui_height()-45, string_hash_to_newline("HOLE " + string(golfHoleNumber)))
            }
        else
            {
            draw_text_transformed(display_get_gui_width()/2, display_get_gui_height()-25, string_hash_to_newline(string(drawTime div 60)), 1.5, 1.5, 0)
            }
        draw_set_alpha(1)
        }
    }
    
if gameOver and !inMenu
    {
    //draw box
    draw_set_alpha(0.8)
    if (global.gameMode == "dodgeball"){
        if winner != -1
            draw_set_color(characterColors[winner])
        else
            draw_set_color(c_white)
        }
    else if (global.gameMode == "golf"){
        if !instance_exists(LastHole){
            draw_set_color(c_ltgray)
		}
        else{
            if winner != -1
                draw_set_color(characterColors[winner])
            else
                draw_set_color(c_white)
				
			//fire works
			if irandom(45) == 0{
				fireworkX = irandom(room_width)
				fireworkY = irandom(room_height/2)
				for(r=0; r<360; r+=360/15)
				    {
				    with instance_create(fireworkX,fireworkY,ExplotionParticle)
				        {
				        image_blend = choose(c_black, c_white, c_ltgray, c_gray)
				        if other.winner != -1 and irandom(3) > 0
							image_blend = merge_color(other.characterColors[other.winner], choose(c_black, c_white), random(0.25))
						physics_apply_impulse(x,y, random_range(0.005, 0.01)*cos(degtorad(other.r))*sqrt(global.timeDiff), random_range(0.005, 0.01)*sin(degtorad(other.r))*sqrt(global.timeDiff))
				        }
				    }
    
    
				myEpl = audio_play_sound(BombExplosionSound, 1, false)
				audio_sound_gain(myEpl, 0.8, 0)
				}
            }
			
        }
        
    draw_rectangle(-5, display_get_gui_height()/2-75, display_get_gui_width()+5, display_get_gui_height()/2-70, false)
    draw_rectangle(-5, display_get_gui_height()/2+70, display_get_gui_width()+5, display_get_gui_height()/2+75, false)
    draw_set_color(c_gray)
    draw_rectangle(-5, display_get_gui_height()/2-70, display_get_gui_width()+5, display_get_gui_height()/2+70, false)
    draw_set_color(c_black)
    draw_rectangle(-5, display_get_gui_height()/2-76, display_get_gui_width()+5, display_get_gui_height()/2+75, true)
    draw_rectangle(-5, display_get_gui_height()/2-71, display_get_gui_width()+5, display_get_gui_height()/2+70, true)
    
    //dodgeball or last hole
    if (global.gameMode == "dodgeball"){  
        //Draw Text
        draw_set_font(winnerFont)
        
        draw_set_halign(fa_center)
        draw_set_valign(fa_middle)
        draw_set_alpha(0.9)
        
        if winner != -1{
            draw_set_color(characterColors[winner])
            draw_text(display_get_gui_width()/2, display_get_gui_height()/2, string_hash_to_newline("PLAYER " + string(winner+1) + " WINS!"))
            }
        else{
            draw_set_color(c_white)
            draw_text(display_get_gui_width()/2, display_get_gui_height()/2, string_hash_to_newline("TIE!"))
            }
            
        draw_set_font(mainFont)
        if alarm[1] < 1
            {
            draw_set_alpha(0.8)
            draw_set_color(c_white)
            draw_text(display_get_gui_width()/2, display_get_gui_height()/2 + 50, string_hash_to_newline("press ENTER or BUTTON1"))
            }
        draw_set_alpha(1)
        }
        
        //golf hole
        else if global.gameMode == "golf"{
            scoreWidth = (display_get_gui_width() * (0.6+0.05*(6-1)))
            scoreDistance = scoreWidth/6
            scoreStart = display_get_gui_width()/2 - (scoreDistance*(ds_list_size(totalScores)-1)/2)
            draw_set_font(mainFont)
            
            if !instance_exists(LastHole){
                draw_set_color(c_white)
                draw_text(display_get_gui_width()/2, display_get_gui_height()/2 - 38, string_hash_to_newline("SCORES:"))
                }
            else
                {
                if winner == -1
                    {
                    draw_set_color(c_white)
                    draw_text_transformed(display_get_gui_width()/2, display_get_gui_height()/2 - 40, string_hash_to_newline("TIE!"), 1.2, 1.2, 0)
                    }
                else{
                    draw_set_color(characterColors[winner])
                    draw_text_transformed(display_get_gui_width()/2, display_get_gui_height()/2 - 40, string_hash_to_newline("PLAYER " +  string(winner+1) + " WINS!"), 1.2, 1.2, 0)
                    }
                }
        
            for(i=0; i<ds_list_size(scores); i++)
                {
                draw_set_color(characterColors[i])
                draw_set_halign(fa_center)
                draw_set_valign(fa_middle)
                draw_set_alpha(0.8)
                draw_text(scoreStart + scoreDistance*i + 15, display_get_gui_height()/2, string_hash_to_newline(string(ds_list_find_value(totalScores, i))))
                draw_sprite_ext(HeadSpr, ds_list_find_value(headList, i), scoreStart + scoreDistance*i - 15, display_get_gui_height()/2, 1, 1, 0, c_white, 0.8)
                draw_set_alpha(1)
            }
            draw_set_font(mainFont)
            if alarm[1] < 1
                {
                draw_set_alpha(0.8)
                draw_set_color(c_white)
                draw_text(display_get_gui_width()/2, display_get_gui_height()/2 + 50, string_hash_to_newline("press ENTER or BUTTON1"))
                }
            draw_set_alpha(1)
        }
    }
