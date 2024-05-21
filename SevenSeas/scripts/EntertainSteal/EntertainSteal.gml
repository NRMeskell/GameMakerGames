function EntertainSteal() {
	// safely play

	if argument0
	    {
	    items = LoseRandomItems(instance_number(Pirate) div 3)
	    ds_list_add(global.notificationList, "caught!", "someone notices, and the crowd attack and rob your crew! Items lost: " + items)
		}
	else
	    {
	    GetRandomLoot(irandom_range(1,2), "Pockets", [-1,0,0,0,0,1,1])
		with Pirate{
			UpdateMorale(1, global.FEARSOME)
			if irandom(1)
				UpdateMorale(1, global.DARING)
			}
	    ds_list_add(global.notificationList, "success!", "the crew is able to pick several pockets!")
	    }

	script_execute(closeEventCode)



}
