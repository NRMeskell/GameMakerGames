/// @description Do attack

endRound = true
var targets = ds_list_create()
with Enemy
	ds_list_add(targets, id)
with Pirate
	ds_list_add(targets, id)
	
var crewTarget = ds_list_find_value(targets, irandom(ds_list_size(targets)-1))
UpdateHealth(crewTarget, -20)
damage = 20


//Add damage multiplier
with instance_create(50,50,EffectParent) {
    if other.myShipTarget == Ship
        team = "pirate"
    else
        team = "enemy"

    effect = "damageMultiplier"
    multiplier = 2.0
    duration = 1
}

