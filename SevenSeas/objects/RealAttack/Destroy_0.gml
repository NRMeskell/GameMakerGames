/// @description Turn Over Unstun Enemy Crew

if activated{
	if instance_exists(myCrewTarget)
		myCrewTarget.stunned = false
	if instance_exists(myShipTarget)
		myShipTarget.stunned = false
}
