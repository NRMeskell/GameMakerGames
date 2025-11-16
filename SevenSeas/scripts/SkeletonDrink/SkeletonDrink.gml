function SkeletonDrink() {
	//Plague Ship Arrive

	with instance_create(0,0,Event)
	    {
	    buttonNumber = 3
	    ds_list_add(buttons, choose(closeEventCode, SkeletonDrinkRefuse), SkeletonDrinkTake)
	    ds_list_add(buttonStats, 0, 0)
	    ds_list_add(buttonRequires, 0, 0)
	    ds_list_add(buttonCosts, 0, 0)
	    ds_list_add(buttonText, "refuse the offer", "accept the offer")
        
	    global.allowSelect = false
	    captionText = "Offered Gift!"
    
	    eventText = "Seeing your out of place crew, the skeletal harbormaster offers a small welcome gift."
	    global.moraleBoost = "skeleton"  
	    }
}

function SkeletonDrinkRefuse() {
	ds_list_add(global.notificationList, "insulted!", "the harbormaster is offended that you would refuse her kind gift, and raises prices for your crew!")
	with MapShip.targetPort{
	    for(i=0; i<3; i++){
	        with slotBuild[i]{
	            for(r=0; r<3; r++){
	                for(n = 0; n<ds_list_size(itemList[r]); n++){
	                        checkItem = ds_list_find_value(itemList[r], n)
	                        checkItem.cost = (checkItem.cost * 1.25) div 1
	                }
	            }
	        }
	    }
	}
}

function SkeletonDrinkTake() {
	if irandom(1){
		ds_list_add(global.notificationList, "generous gift!", "The harbormaster gives you a considerate gift, and welcomes you into the port.")
		GetRandomLoot(1, "Gift", [-1, 1, 1, 6, 6])
	}
	else{
		ds_list_add(global.notificationList, "removed head!", "the harbormaster's 'gift' was her own head! The crew are startled, but she seems very amused by the trick.")
		UpdateMorale(-2, -1)
	}
	closeEventCode()
}

