function UpdateMorale(change, personality) {
	if object_index == Pirate{
		PirateMoraleUpdate(change, personality)
	}
	else{
		with Pirate
			PirateMoraleUpdate(change, personality)
	}
}

function PirateMoraleUpdate(change, personality){
	moraleChange = 0
	if myMainPer == personality or personality == -1
	    moraleChange = change

	repeat(abs(moraleChange))
	    {
	    if true //always gain morale random(1) < power(2,(global.seaLevel-stars))
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
