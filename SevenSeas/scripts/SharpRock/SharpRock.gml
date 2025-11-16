function SharpRock() {
	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3
	    ds_list_add(buttons, RocksAvoided, RocksSailing)
	    ds_list_add(buttonStats, 5, 3)
	    ds_list_add(buttonRequires, global.eventDiff[5, 2], global.eventDiff[3,3])
	    ds_list_add(buttonCosts, 0, 0)
	    ds_list_add(buttonText, "Sail around incoming rocks", "push-off incoming rocks")
        
	    global.allowSelect = false
	    captionText = "Sharp Glassy Rocks!"
	    eventText = "A volcanic rock sticks up from the water, indicating other dangers might lie just below the surface..."   
	    global.moraleBoost = "sharp rocks"
	    }
		
		instance_create(-1000, 0, SharpRocks)
}


function RocksAvoided() {
	if argument0{
		ds_list_add(global.notificationList, "Rocks Avoided!", "Other dangerous rocks are spotted, and the ship passes safely through the danger.")
		
	}
	else{
		ds_list_add(global.notificationList, "Sharp Crash!", "A sharp rock cuts through the hull, damaging the ship badly!")
		UpdateHealth(Ship, -irandom_range(150, 250) div 5 * 5)
	}
	closeEventCode()
}

function RocksSailing(){
	if argument0{
		ds_list_add(global.notificationList, "Rocks Avoided!", "The crew works hard to avoid any rocks which near the ship.")
		
	}
	else{
		ds_list_add(global.notificationList, "Sharp Crash!", "A sharp rock cuts through the hull, damaging the ship badly!")
		UpdateHealth(Ship, -irandom_range(150, 250) div 5 * 5)
	}
	closeEventCode()
}
