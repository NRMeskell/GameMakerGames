/// @description Grab Barrel
function FloatingBarrelGrab() {

	if argument0{
	    result = irandom(10)

		if result < 7
		    {   
		    loot = GetRandomLoot(irandom_range(0,2), "BARREL CONTENTS", undefined)
		    text = getItemText(loot, ["equipment", "gold", "jewels", "ammo", "planks", "grub", "rum", "grub"])
			ds_list_add(global.notificationList, "Hoisted aboard!", "The barrel was full of " + text)
			}
		else
		    {
		    ds_list_add(global.notificationList, "The barrel was filled with rats!", "They swarm aboard and disappear below deck!")
		    with instance_create(0,0,ConditionTimer)
		        condition = RatsEvent
		    }
    
		instance_destroy(Barrel)
		}
		else{
			ds_list_add(global.notificationList, "The barrel could not be grabbed!", "The crew failed to capture the barrel. The failure caused some bickering, lowering morale")
			UpdateMorale(-1, -1)
			UpdateMorale(-1, global.DARING)
		}
	closeEventCode()
}
