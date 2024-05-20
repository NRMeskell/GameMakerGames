/// @description Animate

repeat(damage)
    {
    i = irandom(instance_number(crewTarget)-1)
    nextTargetPirate = instance_find(crewTarget, i)
    if shipTarget == CombatRunner
        nextTargetPirate.myHealth -= UpdateCrewDamage(1, nextTargetPirate)*CombatRunner.enemyTurnDamage
    if shipTarget == Ship
        nextTargetPirate.myHealth -= UpdateCrewDamage(1, nextTargetPirate)*CombatRunner.playerTurnDamage
    }

