/// @description Move to main slot

mySlot.occupied = false
if myMainSlot.occupied == false and myMainSlot.xSpot[Ship.shipType] != -50 {
	mySlot = myMainSlot
	mySlot.occupied = true
	mySlot.myThing = id
}
else{
	for(i=0; i<instance_number(ShipSlot) and !slotFound; i++)
	    {
	    mySlot = instance_find(ShipSlot, i)
	    if (mySlot.occupied = false and mySlot.xSpot[Ship.shipType] != -50 and mySlot.myLayer != 2){
			if mySlot.slotType == myMainSlot.slotType{
				myMainSlot = mySlot
				mySlot.occupied = true
				mySlot.myThing = id
				
				exit
			}
		}
	}
}

event_user(4)




