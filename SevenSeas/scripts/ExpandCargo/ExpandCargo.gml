/// @description clean up the mess

function ExpandCargo(argument0) {
	//Ambushed

	with instance_create(0,0,Request)
	    {
	    myPirate = argument0
		cargoType = instance_find(Cargo, irandom(instance_number(Cargo)-1)).image_index
		
			
	    buttonNumber = 2
	    ds_list_add(buttons, ExpandCargoAllow) 
	    global.allowSelect = false
	    eventText = "I think I can create a few more " + ItemRunner.cargoName[cargoType] + ". Can I give it a go?"
    
	    global.moraleBoost = "make cargo"
	    }
}


function ExpandCargoAllow() {
	amount = min(round(1 + CargoAmount(cargoType)/10), CargoAmount(cargoType))
	if irandom(2){
		ds_list_add(global.notificationList, "Cargo Expanded!", myPirate.firstName + " cleverly split the " + ItemRunner.cargoName[cargoType] + ", creating " + string(amount) + " more!")
		StoreCargo(cargoType, amount)
	}
	else{
		ds_list_add(global.notificationList, "Cargo Destroyed!", myPirate.firstName + " tried splitting the " + ItemRunner.cargoName[cargoType] + ", but destroyed " + string(amount) + " instead!")
		LoseCargo(cargoType, amount)
	}
}
