function UpdateMorale(argument0, argument1) {
	if object_index == Pirate{
		PirateMoraleUpdate(argument0, argument1, id)
	}
	else{
		with Pirate
			PirateMoraleUpdate(argument0, argument1, id)
	}
}

function PirateMoraleUpdate(argument0, argument1, argument2){
	moraleChange = 0
	if myMainPer == argument1 or argument1 == -1
	    moraleChange = argument0

	repeat(abs(moraleChange))
	    {
	    if random(1) < power(2,(global.seaLevel-stars))
	        {
	        if sign(moraleChange) == -1
	            {
	            if myPet.itemPower != "morale loss"
	                morale --
	            }
	        if sign(moraleChange) == 1
	            {
	            morale ++
	            if myPet.itemPower == "morale gain" and random(1) < 0.5
	                morale ++
	            }
	        }
	    }
	}
