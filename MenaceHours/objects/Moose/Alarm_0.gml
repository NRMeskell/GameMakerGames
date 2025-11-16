/// @description Get Pathing
// You can write your code in this editor
		
if ds_list_size(catPath) == 0{
	CreateGraph(platMap)
	
	if !menace
		desire = choose("", "eat", "play", "sit")
	else
		desire = choose("play", "attack", "attack")

	var target = noone
	target = FindDesire(desire)

	chase = false
	if target != noone{
		GetPath(x, y-1, target.x, target.y-1, platMap, catPath)
		if target.exciting == true
			chase = true
	}
	else{
		GetPath(x, y-1, irandom_range(0, room_width), irandom_range(0, room_height), platMap, catPath)
	}
}

alarm[0] = irandom_range(room_speed*5, room_speed*20)*(1+3*(desire=="sleep"));
if menace and desire == "attack"{
	alarm[0] = room_speed/2
}