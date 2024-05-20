/// @description heal

with myCrewTarget
    {
    if other.myShipTarget = Ship
        myHealth += ceil((round(1+global.totalMedicalBonus)*other.priority))
    else
        myHealth += ceil((round(1+CombatRunner.stats[3])*other.priority))
    }

