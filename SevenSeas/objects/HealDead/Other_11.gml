/// @description heal

with Enemy{
	myHealth += round((maxHealth - myHealth)/2)
}
with CombatRunner{
	myHealth += round((maxHealth - myHealth)/2)
}
with Pirate if mySkin == 4{
	myHealth += round((maxHealth - myHealth)/2)
}
