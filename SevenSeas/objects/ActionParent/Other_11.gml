/// @description Attack

with instance_create(0,0,myAttack)
    {
    targetPirate = other.myTarget
    myPirate = other.myPirate
    priority = other.priority
	myButton = other.id
    }

