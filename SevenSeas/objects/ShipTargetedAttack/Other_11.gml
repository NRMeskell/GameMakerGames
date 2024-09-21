/// @description Animate

repeat(damage)
    {
	with crewTarget if AreAdjacent(other.targetPirate, id)
        myHealth -= UpdateCrewDamage(1, id)
    }
