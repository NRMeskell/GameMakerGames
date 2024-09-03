// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ItemExists(argument0){
	itemFound = false
	for(var i=0; i<instance_number(ItemParent); i++){
		var checkItem = instance_find(ItemParent, i)
		if checkItem.itemName == argument0
			itemFound = true
	}
	return itemFound
}