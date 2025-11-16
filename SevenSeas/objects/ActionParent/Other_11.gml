/// @description Attack

with instance_create(0,0,myAttack)
    {
    targetPirate = other.myTarget
    myPirate = other.myPirate
    priority = other.priority
	myButton = other.id
	
	// Parrot
	if myPirate.object_index = Pirate
		if myPirate.myPet.itemInfo == "a colorful flying companion, smart and quick to help"{
			priority += 2
	}
}

