/// @description Apply effect
function ApplyCrewEffect(argument0, argument1) {

	with argument1
	    {
	    stunned = false
	    bleeding = false
	    exposed = false
	    }
    
	if argument0 == "stun"
	    argument1.stunned = true
	if argument0 == "bleed"
	    argument1.bleeding = true
	if argument0 == "expose"
	    argument1.exposed = true



}
