function SwitchShips(argument0) {
	//Switch Ship Types

	Pirate.visible = false

	Ship.shipType = argument0
	MapShip.image_index = argument0

	with ShipSlot
	    {
	    x = xSpot[Ship.shipType]
	    y = xSpot[Ship.shipType]
	    }
    
	with Pirate
	    {
	    if mySlot.xSpot[Ship.shipType] = -50
	        {
	        mySlot = instance_find(ShipSlot, random(instance_number(ShipSlot)-1))
    
	        while mySlot.occupied = true or mySlot.xSpot[Ship.shipType] = -50 or mySlot.myLayer = 2
	            mySlot = instance_find(ShipSlot, random(instance_number(ShipSlot)-1))
	        }
	    }
    
	Ship.maxHealth = global.maxHealthType[Ship.shipType]
	Ship.myHealth = Ship.maxHealth
	Ship.healthDiff = Ship.maxHealth

	Pirate.visible = true

	if global.inPort = true
	    Ship.portSelect = false
}
