/// @description Drawing Cat
// You can write your code in this editor

event_inherited()

var headX, headY, tailX, tailY, drawX = x, drawY = y;

if ds_list_size(catPath) > 0 and !pickedUp{
	image_xscale = (ds_list_find_value(catPath, 0).pointX > x) ? 1 : -1;
}

// Determine Cat Body
if state == "sitting"
	sprite_index = MooseSittingSpr
else if state == "walking" or state == "stalking"
	sprite_index = MooseWalkingSpr
if state == "jumping"
	sprite_index = MooseJumpingSpr
if state == "chasing"
	sprite_index = MooseRunningSpr
if state == "held"
	sprite_index = MooseHeldSpr
	
for(var i=0; i<2; i++){
	if i==1 or hoveringOver{
		// Draw Tail (if applicable)
		if state == "walking" or state == "stalking"{
			tailX = 11 - image_xscale*(sprite_xoffset)
			tailY = 16 - (sprite_yoffset)
			draw_sprite_outline(MooseTailSpr, image_index, drawX+image_xscale*tailX, drawY+tailY, image_xscale, (menace) ? -1 : 1, 0, c_white, 1, !i, InReach() ? c_white : merge_color(c_gray, c_ltgray, 0.4))
		}

		// Draw Body
		draw_sprite_outline(sprite_index, image_index, drawX, drawY, image_xscale, 1, 0, c_white, 1, !i, InReach() ? c_white : merge_color(c_gray, c_ltgray, 0.4))
	
		// Draw Head
		if state != "jumping" {
			headX = (headMap[? sprite_index][0]+2*(menaceTimer>=3)) - image_xscale*(sprite_xoffset)
			headY = (headMap[? sprite_index][1]+8*(menaceTimer>=3)) - (sprite_yoffset + 5*(menaceTimer>=3)) + (current_second div 5) mod 2 + (state=="chasing")*(current_time/500) mod 2 + (state=="held")*(current_time/1000) mod 2 
			var blink = (current_second mod 10 == 0) 
			var turn = (state == "sitting") ? ((Player.x > x) ? 1 : -1) : image_xscale
			if !menace
				draw_sprite_outline(MooseHeadSpr, blink ? 0 : 1, drawX+image_xscale*headX, drawY+headY, turn, 1, 0, c_white, 1, !i, InReach() ? c_white : merge_color(c_gray, c_ltgray, 0.4))
			else
				draw_sprite_outline(MooseHeadSpr, 2, drawX+image_xscale*headX, drawY+headY, turn, 1, 0, c_white, 1, !i, InReach() ? c_white : merge_color(c_gray, c_ltgray, 0.4))
		}
	}
}
