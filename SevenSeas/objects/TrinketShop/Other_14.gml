/// @description make Items
itemList[0] = ds_list_create() 

//Generate Loot
repeat(irandom_range(2,4))
    {
    type = irandom(4)
    if type == 0 
        newItem = GenerateHatItem(irandom(global.seaLevel div 2) + choose(0,1))
    else if type == 1
        newItem = GenerateShirtItem(irandom(global.seaLevel div 2) + choose(-1,1))
    else if type == 2
        newItem = GeneratePantsItem(irandom(global.seaLevel div 2) + choose(-1,1))
    else if type == 3
        newItem = GenerateHandItem(irandom(global.seaLevel div 2) + choose(0,1))
    else if type == 4
        newItem = GeneratePetItem(choose(0,1))
        
    with newItem
        {
        selected = false
        cost = itemCost
        }
    ds_list_add(itemList[0], newItem)
    }

///make Cargo
itemList[1] = ds_list_create() 

//Generate Loot
repeat(irandom_range(2,4))
    {
    type = irandom_range(2,5)
    newItem = instance_create(0,0,StoreObjectStorable)
    with newItem
        {        
        itemNumber = other.type
        amount = round((irandom_range(5,10) + (5*(global.seaLevel + 1)))/ItemRunner.cargoCost[itemNumber]) + 1
        selected = false
        cost = ItemRunner.cargoCost[itemNumber]+ irandom(2) + ItemRunner.cargoCost[itemNumber]*amount               
        selected = false
        }
    ds_list_add(itemList[1], newItem)
    }

///Make Trades

types = ds_list_create()

itemList[2] = ds_list_create()
newTrade = instance_create(-50,-50,StoreObjectTrade)
with newTrade
    {
    type = 1
    myLocation = other.id
    selected = false
    }
ds_list_add(itemList[2], newTrade)


tradeNumber = irandom_range(1,3)
for(i=0; i<tradeNumber; i++)
    {
    newTrade = instance_create(-50,-50,StoreObjectTrade)
    with newTrade
        {
        type = irandom_range(2,5)
        while ds_list_find_index(other.types, type) != -1
            type = irandom_range(2,5)
        
        ds_list_add(other.types, type)
        myLocation = other.id
        selected = false
        }
        
    ds_list_add(itemList[2], newTrade)
    }

