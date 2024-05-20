/// @description track differences

if ds_list_size(global.notificationList) == 0
	ds_list_add(global.notificationList, "Status Update", "")

lostMorale = 0
gainedMorale = 0
lostHealth = 0
gainedHealth = 0
gainedCrew = ""
lostCrew = ""
gainedCargo = 0
lostCargo = 0
lostItem = ""
gainedItem = ""

//check for pirate updates
with Pirate{
	if !is_undefined(ds_map_find_value(other.pirateMap, id)){
		//check crew health
		checkHealth = ds_map_find_value(other.pirateMap, id)[0]
		if myHealth < checkHealth
			other.lostHealth += abs(checkHealth - myHealth)
		if myHealth > checkHealth
			other.gainedHealth += abs(checkHealth - myHealth)
			
		//check crew morale
		checkMorale = ds_map_find_value(other.pirateMap, id)[1]
		if morale < checkMorale
			other.lostMorale += abs(checkMorale - morale)
		if morale > checkMorale
			other.gainedMorale += abs(checkMorale - morale)
	}
	else
		other.gainedCrew = name
}

//check for lost Pirates
for (var k = ds_map_find_first(other.pirateMap); !is_undefined(k); k = ds_map_find_next(other.pirateMap, k)) {
	var v = other.pirateMap[? k];
	/* Use k, v here */
	if !instance_exists(k)
		other.lostCrew = v[2]
}


//check for cargo updates
for(var i=0; i<array_length(ItemRunner.cargoName); i++){
	if cargo[i] < CargoAmount(i)
		other.gainedCargo += abs(cargo[i] < CargoAmount(i))
	if cargo[i] > CargoAmount(i)
		other.gainedCargo -= abs(cargo[i] < CargoAmount(i))
}

//check for item updates
with ItemParent{
	if is_undefined(ds_map_find_value(other.itemMap, id)){
		other.gainedItem = itemName
	}
}

//check for lost items
for (var k = ds_map_find_first(other.itemMap); !is_undefined(k); k = ds_map_find_next(other.itemMap, k)) {
	var v = other.itemMap[? k];
	/* Use k, v here */
	if !instance_exists(k)
		other.lostItem = v
}

//Generate Gained String
myGainString = ""
if gainedHealth > 0
	myGainString += "Health gained: " + string(gainedHealth) + "#"
if gainedMorale > 0
	myGainString += "Morale gained: " + string(gainedMorale) + "#"
if myShipHealth < Ship.myHealth
	myGainString += "Ship Repaired: " + string(abs(myShipHealth - Ship.myHealth)) + "#"
if gainedCargo > 0
	myGainString += "Cargo gained: " + string(gainedCargo) + "#"
if gainedItem != ""
	myGainString += "New Item: " + gainedItem + "#"
if gainedCrew != ""
	myGainString += "New crew: " + gainedCrew + "#"
	
//Generate Loss String
myLossString = ""
if lostHealth > 0
	myLossString += "Health Lost: " + string(lostHealth) + "#"
if lostMorale > 0
	myLossString += "Morale lost: " + string(lostMorale) + "#"
if lostCargo > 0
	myLossString += "Cargo gained: " + string(lostCargo) + "#"
if myShipHealth < Ship.myHealth
	myGainString += "Ship damaged: " + string(abs(myShipHealth - Ship.myHealth)) + "#"
if lostItem != ""
	myLossString += "New Item: " + lostItem + "#"
if lostCrew != ""
	myLossString += "New crew: " + lostCrew + "#"

myFinalString = myGainString + myLossString
if string_ends_with(myFinalString, "#")
	myFinalString = string_copy(myFinalString, 0, string_length(myFinalString)-2)
	
ds_list_replace(global.notificationList, ds_list_size(global.notificationList) -1, ds_list_find_value(global.notificationList, ds_list_size(global.notificationList)-1) + myFinalString)