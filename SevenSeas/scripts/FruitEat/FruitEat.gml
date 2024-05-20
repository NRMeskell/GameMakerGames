function FruitEat() {
	//Dont let play

	if irandom(2) > 0
	    {
	    with Pirate
	        {
	        UpdateMorale(1,-1)
	        UpdateMorale(1,global.DARING)
	        }
        
	    ds_list_add(global.notificationList, "Delicious Fruit!", "the crew enjoy a wonderful snack!")
	    }
	else if irandom(1)
	    {
	    with Pirate
	        {
	        UpdateMorale(-1,-1)
	        UpdateMorale(-1,global.KEEN)
	        }
	    ds_list_add(global.notificationList, "Horrible Fruit!", "the crew are disgusted by the awful taste!")
	    }


	script_execute(closeEventCode)







}
