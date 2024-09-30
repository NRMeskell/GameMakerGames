function SearchSupplies(){
	/// @description Search For supplies
	global.moraleBoost = "supplies"
	
	if myPortType = 0
	    {
	    loot = GetRandomLoot(max(0, 3  + irandom_range(-1,0)), "supplies", [2,2,2,3,3,3,4,4])
		title = "desolate shore"
		text = "on the steep and rocky shore, the crew find " + getItemText(loot, ["", "", "", "round stones", choose("branches", "scraps"), "fish"]) + "."
		}
	else if myPortType = 3
	    {
	    loot = GetRandomLoot(max(0, 3  + irandom_range(-1,0)), "supplies", [2,3,3,3,4,4,4,4,6])
		title = "sandy beach"
		text ="In the soft sandy beach, the crew find " + getItemText(loot, ["", "", "", choose("rocks", "stones"), choose("driftwood", "dried plants"), choose("berries", "shore-animals"), "", choose("fruit", "seafood")]) + "."
	    }
	else if myPortType = 2
	    {
		title = "steep cliffs"
	    loot = GetRandomLoot(max(0, 3  + irandom_range(-2,-1)), "supplies", [1,2,2,3,3,4,4,6,6])
		text = "scattered around the cliffside, the crew find " + getItemText(loot, ["", "", choose("diamonds", "precious stones"), "loose stones", "driftwood", "edible plants", "", "delicous roots"]) + "."
		}
	else if myPortType = 4
	    {
		title = "jungle edge"
		loot = GetRandomLoot(max(0, 3  + irandom_range(-1,0)), "supplies", [3,3,3,3,3,4,6,6,4])
		lootText = getItemText(loot, ["", "", "", "", choose("branches", "lumber"), choose("berries", "roots", "plants"), "", choose("animals", "game", "fruit")])
		text = "On the edge of the dense jungle, the crew find " + lootText
		}
	else if myPortType = 5
	    {
		title = "pretty oasis"
		loot = GetRandomLoot(max(0, 3  + irandom_range(-2,-1)), "supplies", [1,1,2,2,3,3,4,4,6])
		lootText = getItemText(loot, ["", "gold", "gems", "smooth stones", choose("branches", "lumber"), choose("berries", "roots", "plants"), "", choose("animals", "game", "fruit")])
		text = "Around the sparkling water, the crew find " + lootText + "."
		}
	else if myPortType = 6
	    {
		title = "old wreckage"
		loot = GetRandomLoot(choose(2,3,3,4), "supplies", [2,3,4,5])
		lootText = getItemText(loot, ["", "", "", "cannonballs", "old planks", "stale rations", "aged grog", ""])
		text = "Among the wreckage, the crew find boxes full of " + lootText + "."
		}
	else if myPortType = 7
	    {
		title = "barren rocks"
		loot = GetRandomLoot(irandom_range(0,2), "supplies", [2,2,2,3,3,4,6])
		lootText = getItemText(loot, ["", "", "", "smoothed rocks", "small trees", "fish", "", "fish"])
		text = "Near the sea lions, the crew find " + lootText + "."
		}
	else if myPortType = 8
	    {
		title = "arid desert"
		loot = GetRandomLoot(irandom_range(0, 2), "supplies", [2,3,3,3,4])
		lootText = getItemText(loot, ["", "", "", "large stones", "cracked trees", "rodents", "", ""])
		text = "in the cracked desert, the crew find " + lootText + "."
		}
	else if myPortType = 9
	    {
		title = "mystic river"
		loot = GetRandomLoot(irandom_range(0, 2), "supplies", [2,3,4])
		lootText = getItemText(loot, ["", "", "", "smooth rocks", "twisted branches", "dead birds", "", ""])
		text = "along the bank of the river, the crew find " + lootText + "."
		}
		
	ds_list_add(global.notificationList, title, text)
}