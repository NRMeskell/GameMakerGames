/// @description update Stats

name = "Surgery"
if enemyAction == false
    description = "each crew member heals " + string(round(global.totalMedicalBonus+1)) + " health multiplied by action priority."
else
    description = "each crew member heals " + string(round(1+CombatRunner.stats[3])) + " health multiplied by action priority."


