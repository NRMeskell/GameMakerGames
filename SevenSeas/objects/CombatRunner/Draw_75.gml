/// @description Insert description here
// You can write your code in this editor

if !instance_exists(Defeat){
	///Draw End Turn Button
	for(var i=0; i<min(ds_list_size(possibleEnemyActions), array_length(overAction)); i++) {
		if overAction[i]{
			var showAction = ds_list_find_value(possibleEnemyActions, i)[0]
			
			drawActionInfoX = drawOptionsX - sprite_get_width(ActionInfoSpr) - 4
		    drawActionInfoY = drawOptionsY + 20
			DrawActionInfo(showAction.object_index, drawActionInfoX, drawActionInfoY, false, "enemy", undefined)
			
		}
	}
}