/// @description Update enemy stats

ds_list_clear(basicMelleActions)
ds_list_clear(basicRangedActions)
ds_list_clear(basicCannonActions)
ds_list_clear(basicShipActions)

ds_list_clear(specialMelleActions)
ds_list_clear(specialRangedActions)
ds_list_clear(specialCannonActions)
ds_list_clear(specialShipActions)


//Add basic actions
for(i=0; i<ds_list_size(myBasicActions); i++)
    {
    action = ds_list_find_value(myBasicActions, i)
    actionType = ds_map_find_value(actionTypeMap, action)
    if actionType != -1
        {
        if actionType == "melle"
            ds_list_add(basicMelleActions, action)
        else if actionType == "ranged"
            ds_list_add(basicRangedActions, action)
        else if actionType == "cannon"
            ds_list_add(basicCannonActions, action)
        else
            ds_list_add(basicShipActions, action)
        }
    }

myStats[0] = 0
myStats[1] = 0
myStats[2] = 0
myStats[3] = 0

//Add special actions and stats
with Enemy
    if stunned = false
    {
    for(i=0; i<ds_list_size(myStats); i++)
        {
        if ds_list_find_value(myStats, i) < 5
            other.myStats[ds_list_find_value(myStats, i)] += 1
        else
            other.myStats[3] += 1
        }
        
    for(i=0; i<ds_list_size(myActions); i++)
        {
        action = ds_list_find_value(myActions, i)
        actionType = ds_map_find_value(other.actionTypeMap, action)
        if actionType != -1
            {
            if actionType == "melle"
                ds_list_add(other.specialMelleActions, action)
            else if actionType == "ranged"
                ds_list_add(other.specialRangedActions, action)
            else if actionType == "cannon"
                ds_list_add(other.specialCannonActions, action)
            else
                ds_list_add(other.specialShipActions, action)
            }
        }
    }

