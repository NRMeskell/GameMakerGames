/// @description Save item @description SaveItem(item object_index)
/// @param item object_index
function LoadItem(argument0) {

	itemVars = SplitLine(argument0)
	if itemVars[0] == "item"
	    {
	    item = instance_create(0,0,ItemParent)
    
	    item.itemName = itemVars[1]
	    item.itemInfo = itemVars[2]
        
	    if itemVars[3] != "<undefined>"{
	        item.sprite_index = asset_get_index(itemVars[3])
	        }
	    if itemVars[4] != "<undefined>"{
	        item.colorSprite = asset_get_index(itemVars[4])
	        }
        
	    item.itemNumber = real(itemVars[5])
    
	    item.myColor = real(itemVars[6])
    
	    item.damage = real(itemVars[7])
	    item.accuracy = real(itemVars[8])
	    if itemVars[9] != "<undefined>"
	        item.myAction = asset_get_type(itemVars[9])
        
	    item.cost = real(itemVars[10])
	    for(r=0; r<8; r++)
	        item.bonus[r] = real(itemVars[11+r])
	    item.twoHanded = bool(itemVars[19])
	    item.itemPower = itemVars[20]
	    item.itemPowerDescription = itemVars[21] 
    
	    return item
	}



}
