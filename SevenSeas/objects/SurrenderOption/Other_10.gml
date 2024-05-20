/// @description Surrender

with CombatRunner{
    lootMod = other.amount
    surrender = true
	AddReputation("repute", 1, "mercy for surrendering ship")
	AddReputation("fear", -1, "mercy for surrendering ship")
    event_user(5)
    }

