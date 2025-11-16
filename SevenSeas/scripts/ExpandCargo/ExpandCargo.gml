/// @description clean up the mess

function ExpandCargo(argument0) {
	//Ambushed

	with instance_create(0,0,Request)
	    {
	    myPirate = argument0
		if instance_exists(Cargo){
			cargoType = instance_find(Cargo, irandom(instance_number(Cargo)-1)).cargoType
			eventText = "I think I can expand our " + ItemRunner.cargoName[cargoType] + ", and make a few new ones! Can I give it a go?"
		}else{
			cargoType = 4
			eventText = "I think I can make some bread with a little creativity! Can I give it a go?"
		}
			
	    buttonNumber = 2
	    ds_list_add(buttons, ExpandCargoAllow) 
	    global.allowSelect = false
	    
	    global.moraleBoost = "make cargo"
	    }
}


function ExpandCargoAllow() {
	amount = irandom_range(round(CargoAmount(cargoType)/10), CargoAmount(cargoType)/4)
	if irandom(2){
		if instance_exists(Cargo)
			ds_list_add(global.notificationList, "Cargo Expanded!", myPirate.firstName + " cleverly split the " + ItemRunner.cargoName[cargoType] + ", creating " + string(amount) + " more!")
		else
			ds_list_add(global.notificationList, "Cargo Expanded!", myPirate.firstName + " cleverly made some " + ItemRunner.cargoName[cargoType] + ", cooking up " + string(amount) + "!")
		StoreCargo(cargoType, amount)
	}
	else{
		if instance_exists(Cargo){
			ds_list_add(global.notificationList, "Cargo Destroyed!", myPirate.firstName + " tried splitting the " + ItemRunner.cargoName[cargoType] + ", but destroyed " + string(amount) + " instead!")
			LoseCargo(cargoType, amount)
		}else{
			ds_list_add(global.notificationList, "No cargo created!", myPirate.firstName + " couldn't find a way to make any new " + ItemRunner.cargoName[cargoType] + ".")
		}
	}
}
