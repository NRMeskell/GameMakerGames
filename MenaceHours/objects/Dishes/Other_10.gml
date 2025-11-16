/// @description Draw Mini Game
// You can write your code in this editor

event_inherited()

draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_set_color(c_ltgray)

draw_sprite(DishesBackSpr, 0, 0, 0)

var stackSize = [0,0,0]
topDish = [true, true, true, true, true]
for (var i=0; i<array_length(dishSpot); i++){
	for (var j=i+1; j<array_length(dishSpot); j++)
		if dishSpot[j] == dishSpot[i] 
			topDish[i] = false
	var drawX = currentDish == i ? gameMX : width/2 - pegDis + pegDis*dishSpot[i], 
	    drawY = currentDish == i ? gameMY : height/2 - 3*stackSize[dishSpot[i]];
		
	draw_sprite_outline(DishGameSpr, i*2, drawX, drawY, 1, 1, 0, c_white, 1, (topDish[i] and (over == dishSpot[i]) and currentDish==-1) or currentDish==i, c_white)
	stackSize[dishSpot[i]] += 1
}

for (var i=array_length(dishSpot)-1; i>=0; i--){
	stackSize[dishSpot[i]] -= 1
	var drawX = currentDish == i ? gameMX : width/2 - pegDis + pegDis*dishSpot[i], 
	    drawY = currentDish == i ? gameMY : height/2 - 3*stackSize[dishSpot[i]];
	draw_sprite_outline(DishGameSpr, i*2+1, drawX, drawY, 1, 1, 0, c_white, 1, (topDish[i] and (over == dishSpot[i]) and currentDish==-1) or currentDish==i, c_white)
}

draw_text(width/2, height-12, "Moves: " + string(moves))