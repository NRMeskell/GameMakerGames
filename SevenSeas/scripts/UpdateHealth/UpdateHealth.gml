// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function UpdateHealth(target, change){
	if target.object_index == Pirate{
		target.myHealth = clamp(target.myHealth + change, 0, target.maxHealth - target.legLostHealth*target.maxHealth*(target.legLostRight + target.legLostLeft))
	}else{
		target.myHealth = clamp(target.myHealth + change, 0, target.maxHealth) 
	}
}