function SearchSupplies(){
	/// @description Search For supplies
	global.moraleBoost = "supplies"
	
	if myPortType = 0
	    {
	    loot = GetRandomLoot(max(0, 1+campPower + irandom_range(-1,0)), "supplies", [2,2,2,2,3,3,3,4])
		title = "desolate shore"
		text = getItemText(loot, ["", "", "", "round stones", choose("branches", "scraps"), "small animals"]) + " found scattered around the rocks!"
		}
	else if myPortType = 3
	    {
	    loot = GetRandomLoot(max(0, 1+campPower + irandom_range(-1,0)), "supplies", [2,3,3,3,4,4,4,4,6])
		title = "sandy beach"
		text ="The beach provides " + getItemText(loot, ["", "", "", choose("rocks", "stones"), choose("driftwood", "dried plants"), choose("berries", "shore-animals"), "", choose("fruit", "seafood")]) + " in plants and along the shore."
	    }
	else if myPortType = 2
	    {
		title = "steep cliffs"
	    loot = GetRandomLoot(max(0, 1+campPower + irandom_range(-2,-1)), "supplies", [1,2,2,3,3,4,4,6,6])
		text = getItemText(loot, ["", "", choose("diamonds", "precious stones"), "loose stones", "driftwood", "edible plants", "", "delicous roots"]) + " found scattered around the cliffside!"
		}
	else if myPortType = 4
	    {
		title = "jungle edge"
		loot = GetRandomLoot(max(0, 1+campPower + irandom_range(-1,0)), "supplies", [3,3,3,3,3,4,6,6,4])
		lootText = getItemText(loot, ["", "", "", "", choose("branches", "lumber"), choose("berries", "roots", "plants"), "", choose("animals", "game", "fruit")])
		text = "The dense jungle is full of " + lootText
		}
	else if myPortType = 5
	    {
		title = "pretty oasis"
		loot = GetRandomLoot(max(0, 1+campPower + irandom_range(-2,-1)), "supplies", [1,1,2,2,3,3,4,4,6])
		lootText = getItemText(loot, ["", "gold", "gems", "smooth stones", choose("branches", "lumber"), choose("berries", "roots", "plants"), "", choose("animals", "game", "fruit")])
		text = "Around the sparkling water, an odd amount of " + lootText + " can be found."
		}
	else if myPortType = 6
	    {
		title = "old wreckage"
		loot = GetRandomLoot(max(0, 1+campPower + irandom_range(-2,-1)), "supplies", [2,3,4,5])
		lootText = getItemText(loot, ["", "", "", "cannonballs", "old planks", "stale rations", "aged grog", ""])
		text = "Among the wreckage, old supply boxes full of " + lootText + " are found!"
		}
	else if myPortType = 7
	    {
		title = "barren rocks"
		loot = GetRandomLoot(max(0, 1+campPower + irandom_range(-2,-1)), "supplies", [0,1,2,2,2,3])
		lootText = getItemText(loot, ["", "bags of gold", "carved gems", "smoothed rocks", "discarded boards", "", "", ""])
		text = "Around the idols and among the rocks, " + lootText + " are found!"
		}
		
	ds_list_add(global.notificationList, title, text)
}