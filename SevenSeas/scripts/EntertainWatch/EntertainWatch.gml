function EntertainWatch() {
	//Dont let play

	if irandom(2) > 0
	    {
	    with Pirate
	        {
	        UpdateMorale(1,global.JOLLY)
	        }
        
	    ds_list_add(global.notificationList, "A fun time!", "the crew enjoy a wonderful show, and gain morale!")
	    }
	else if irandom(1) > 0{
		var pirateCalled = RandomPirate()
		ds_list_add(global.notificationList, "A fun time!", pirateCalled.firstName + " is called on stage to assist!")
	    with pirateCalled{
			UpdateMorale(-1, global.KEEN)
			UpdateMorale(1, global.DARING)
			UpdateMorale(1, global.JOLLY)
			UpdateMorale(1, global.FEARSOME)
			}
		}
	else
	    {
	    goldAmount = min(CargoAmount(0), irandom(5)*global.seaLevel)
	    LoseCargo(0, goldAmount)
	    ds_list_add(global.notificationList, "robbed!", "while your crew was distracted by the show, they were pick-pocketed for " + string(goldAmount) + " gold.")
	    }


	script_execute(closeEventCode)







}
