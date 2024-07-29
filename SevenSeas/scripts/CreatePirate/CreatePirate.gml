/// @description Create Pirate
function CreatePirate(argument0) {
	if instance_number(Pirate) < Ship.shipMaxCrew[Ship.shipType]
	    {
	    myPirate = instance_create(0,0,Pirate)
    
	    with myPirate
	        {
	        mySlot = instance_find(ShipSlot, random(instance_number(ShipSlot)-1))
	        while (mySlot.occupied = true or mySlot.xSpot[Ship.shipType] = -50 or mySlot.myLayer = 2) or mySlot.slotType == "bed"
	            {
	            mySlot = instance_find(ShipSlot, random(instance_number(ShipSlot)-1))
	            } 
			myPrevSlot = mySlot
        
	        mySlot.occupied = true
	        mySlot.myThing = id
        
	        ds_list_add(global.crewList, id)
	        global.crewSize ++
        
	        if argument0 == true
	            {
	            EquipItem(id, MakeRandomShirtItem(-1))
	            EquipItem(id, MakeRandomPantsItem(-1))
	            if irandom(1)
					EquipItem(id, MakeRandomHandItem(0))
	            }
				
			event_user(4)
	        }
        
	    return myPirate
	    }
	else
	    return undefined
}
