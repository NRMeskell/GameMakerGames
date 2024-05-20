// Used for reputation creation (type, amount, details)

/* Types: see ReputationRunner */

///@description AddReputation(type, amount, event name)
///@param type
///@param amount
///@param event name
function AddReputation(argument0, argument1, argument2){		
	if argument1 > 0{
		cancelRep = false
		for(var i=0; i<ds_list_size(global.reputation) and cancelRep = false; i++){
			checkValue = ds_list_find_value(global.reputation, i)
			if checkValue[0] == argument0 and sign(checkValue[1]) != sign(argument1){
				if (checkValue[1]) >= abs(argument1)
					ds_list_replace(global.reputation, i, [checkValue[0], checkValue[1]-argument1, checkValue[2]])
				else{
					ds_list_replace(global.reputation, i, [argument0, argument1-checkValue[1], argument2])
				}
				cancelRep = true
			}
		}
		if !cancelRep
			ds_list_add(global.reputation, [argument0, argument1, argument2])
		
		for(var i=0; i<ds_list_size(global.reputation); i++){
			if ds_list_find_value(global.reputation, i)[1] == 0
				ds_list_delete(global.reputation, i)
		}
	}
	
	myDisplay = instance_create(MapCreator.conquerButtonX - 40, -20, ReputationDisplay)
	myDisplay.repType = argument0
	myDisplay.amount = argument1
}

function searchReputationType(argument0){
	searchList = ds_list_create()
	searchAmount = 0
	for(var i=0; i<ds_list_size(global.reputation); i++){
		if ds_list_find_value(global.reputation, i)[0] == argument0{
			searchAmount += ds_list_find_value(global.reputation, i)[1]
			ds_list_add(searchList, [ds_list_find_value(global.reputation, i)[2], ds_list_find_value(global.reputation, i)[1]])
		}
	}
	
	if searchAmount == 0
		return [0, ""]
	else{
		var searchPlace = irandom_range(0, abs(searchAmount))
		var repNum;
		for(repNum=0; repNum<searchPlace; repNum+=1){
			searchPlace -= abs(ds_list_find_value(searchList, repNum)[1])
		}
		return [searchAmount div (power(global.seaLevel, 2) + 1), ds_list_find_value(searchList, min(repNum, ds_list_size(searchList)-1))[0]]
	}
}

