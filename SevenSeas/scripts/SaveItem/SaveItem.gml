/// @description Save item @description SaveItem(item object_index)
/// @param item object_index
function SaveItem(argument0) {

	item = argument0
	itemString = ""
	if item.object_index == ItemParent or item.object_index == StoreObjectItem{
	    itemString += "item;"
	    itemString += string(item.itemName) + ";"
	    itemString += string(item.itemInfo) + ";"
    
	    itemString += string(sprite_get_name(item.sprite_index)) + ";"
	    itemString += string(sprite_get_name(item.colorSprite)) + ";"
	    itemString += string(item.itemNumber) + ";"
	    itemString += string(item.myColor) + ";"
    
	    itemString += string(item.damage) + ";"
	    itemString += string(item.accuracy) + ";"
	    if item.myAction != noone
	        itemString += "none,"
	    else
	        itemString += string(object_get_name(item.myAction)) + ";"
        
	    itemString += string(item.cost) + ";"
	    for(i=0; i<8; i++)
	        itemString += string(item.bonus[i]) + ";"
	    itemString += string(item.twoHanded) + ";"
	    itemString += string(item.itemPower) + ";"
	    itemString += string(item.itemPowerDescription)
	}
	else if item.object_index = StoreObjectStorable{
	    itemString += "cargo;"
	    itemString += string(item.itemNumber) + ";"
	    itemString += string(item.amount) + ";"
	    itemString += string(item.cost)
	}
	else if item.object_index = StoreObjectTrade{
	    itemString += "trade;"
	    itemString += string(item.type)
	}
	else if item.object_index = StoreObjectShip{
	    itemString += "ship;"
	    itemString += string(item.myShipType) + ";"
	    itemString += string(item.cost)
	}
	else if item.object_index = StoreObjectHealth{
	    itemString += "health;"
	    itemString += string(item.amount) + ";"
	    itemString += string(item.cost) + chr(10)
	}
	else if item.object_index = StoreObjectPirate{    
	}

	return itemString




}
