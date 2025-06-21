// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function UpdateHealth(target, change){
	target.myHealth = max(0, min(target.myHealth + change, target.maxHealth)) 
	if target.object_index == Pirate{
		target.myHealth = ceil(min(target.myHealth, target.maxHealth - target.legLostHealth*target.maxHealth*(target.legLostRight + target.legLostLeft)))
	}
}