/// @description Animate

var targetCrew = undefined
var healthLeft = 0
with crewTarget{
	if myHealth > healthLeft{
		healthLeft = myHealth
		targetCrew = id
	}
}

UpdateHealth(targetCrew, -damage)

