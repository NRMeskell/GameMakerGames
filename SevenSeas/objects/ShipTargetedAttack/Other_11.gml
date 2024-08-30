/// @description Animate

repeat(damage)
    {
	with crewTarget if AreAdjacent(targetPirate, id)
        myHealth -= UpdateCrewDamage(1, id)
    }
