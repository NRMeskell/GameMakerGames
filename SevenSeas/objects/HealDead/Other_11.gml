/// @description heal

with Enemy{
	UpdateHealth(id, round((maxHealth - myHealth)/2))
}
with CombatRunner{
	UpdateHealth(id, round((maxHealth - myHealth)/2))
}
with Pirate if mySkin == 4{
	UpdateHealth(id, round((maxHealth - myHealth)/2))
}
