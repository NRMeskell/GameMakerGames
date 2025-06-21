/// @description Animate

SpreadDamage(crewTarget, damage)
if targetPirate.myHealth < 1{
	instance_destroy(targetPirate)
	SpreadDamage(crewTarget, damage)
}

