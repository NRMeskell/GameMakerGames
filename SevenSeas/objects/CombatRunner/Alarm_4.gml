/// @description Wait to start turn

playerTurnDamage = 0
enemyTurnDamage = 0

hasPlayerAttack = false;
hasEnemyAttack = false;
with RealAttack{
	if shipTarget = CombatRunner
		hasPlayerAttack = true
	else
		hasEnemyAttack = true
}

event_user(3)

