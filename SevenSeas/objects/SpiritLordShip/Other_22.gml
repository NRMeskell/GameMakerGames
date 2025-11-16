/// @description Update Character

with SpiritLord
    {
	instance_destroy()
    }

///Add Treasure

//Special Item
specialItem = GeneratePetItem(0)
specialItem.itemNumber = 18
specialItem.itemName = "Spirit Dice"
specialItem.itemInfo = "Dice made by death, darkened by the souls of those who bet agaist them."
specialItem.myAction = KnockOfDeathAction
specialItem.itemPower = "none"
specialItem.itemPowerDescription = "none"

	  
with Store{
    replaceItem = ds_list_find_value(items, 0)
    ds_list_replace(items, 0, other.specialItem)
    other.specialItem.myStore = id
    instance_destroy(replaceItem)
}

