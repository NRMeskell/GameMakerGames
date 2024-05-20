/// @description Select all

allFree = allowManySelects

for(i=0; i<ds_list_size(items); i++)
    {
    myCurrentItem = ds_list_find_value(items, i) 
    if myCurrentItem.cost > 0
        allFree = false
    }

if allFree
    for(i=0; i<ds_list_size(items); i++)
        {
        myCurrentItem = ds_list_find_value(items, i) 
        myCurrentItem.selected = true
        } 
    

