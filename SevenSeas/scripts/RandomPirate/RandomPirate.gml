// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function RandomPirate(){
	return instance_find(Pirate, irandom(instance_number(Pirate)-1))
}