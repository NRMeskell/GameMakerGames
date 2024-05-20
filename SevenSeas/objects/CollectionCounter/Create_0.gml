/// @description Count cargo, pirate health, and items

for(var i=0; i<array_length(ItemRunner.cargoName); i++){
	cargo[i] = CargoAmount(i)
}
	
pirateMap = ds_map_create()
with Pirate
	ds_map_add(other.pirateMap, id, [myHealth, morale, firstName])
	
	
itemMap = ds_map_create()
with ItemParent
	ds_map_add(other.itemMap, id, itemName)

myShipHealth = Ship.myHealth

