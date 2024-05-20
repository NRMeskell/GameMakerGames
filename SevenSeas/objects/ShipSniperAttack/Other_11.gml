/// @description Animate

targetPirate.myHealth -= UpdateCrewDamage(damage, targetPirate)

adjacent = 0;
with crewTarget{
    if AreAdjacent(id, other.targetPirate.id) and (id != other.targetPirate.id)
        other.adjacent += 1;
    }

if adjacent < 2
    targetPirate.myHealth -= UpdateCrewDamage(damage, targetPirate);
    

