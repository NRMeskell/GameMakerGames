/// @description Supplies
itemList[1] = ds_list_create()
supNumber = irandom_range(2,4)
for(i=0; i<supNumber; i++)
    {
    newSup = instance_create(0,0,StoreObjectStorable)
    newSup.myLocation = id
    with newSup
        {        
        itemNumber = choose(2,3)
        if itemNumber = 2
            amount = irandom_range(5,10)
        else
            amount = irandom_range(5,10)
        cost = ItemRunner.cargoCost[itemNumber] + irandom(2) + ItemRunner.cargoCost[itemNumber]*amount        
        selected = false
        }
        
    ds_list_add(itemList[1], newSup)
	instance_deactivate_object(newSup)
    }

///Ships

shipTypes = ds_list_create()

if global.seaLevel = 0
    ds_list_add(shipTypes, 0,1,2,3)
if global.seaLevel = 1
    ds_list_add(shipTypes, 1,2,3,4,5,6)
if global.seaLevel = 2
    ds_list_add(shipTypes, 4,5,6)


itemList[0] = ds_list_create()
shipNumber = irandom_range(1,ds_list_size(shipTypes)-1)
for(i=0; i<shipNumber; i++)
    {
    newShipNumber = irandom(ds_list_size(shipTypes)-1)
    while newShipNumber == Ship.shipType
        newShipNumber = irandom(ds_list_size(shipTypes)-1)
        
    newShip = GenerateShipItem(ds_list_find_value(shipTypes, newShipNumber))
    ds_list_delete(shipTypes, newShipNumber)
        
    with newShip
        {
        myLocation = other.id
        selected = false
        }
        
    ds_list_add(itemList[0], newShip)
	instance_deactivate_object(newShip)
    }


///Repairs

repairNumber = 4
itemList[2] = ds_list_create()
for(i=0; i<repairNumber; i++)
    {
    newRepair = instance_create(0,0,StoreObjectHealth)
    newRepair.myLocation = id
    with newRepair
        {        
        amount = (other.i+1)*100*(power(2,global.seaLevel))
        cost = 10 + amount div 20
        selected = false
        }
        
    ds_list_add(itemList[2], newRepair)
	instance_deactivate_object(newRepair)
    }

