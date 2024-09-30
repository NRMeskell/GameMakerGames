/// @description Swords

itemList[0] = ds_list_create()
swordNumber = irandom_range(2,4)
for(i=0; i<swordNumber; i++)
    {
    foundSwordItem = false
    while !foundSwordItem
        {
        newSword = GenerateHandItem(choose(0,sign(irandom(global.seaLevel))))
        if ds_list_find_index(ItemRunner.melleList, newSword.itemNumber) != -1
            foundSwordItem = true
        }
        
    with newSword
        {
        myLocation = other.id
        selected = false
        cost = itemCost
        }
        
    ds_list_add(itemList[0], newSword)
	instance_deactivate_object(newSword)
    }


///Guns

itemList[1] = ds_list_create()
gunNumber = irandom_range(2,5)
for(i=0; i<gunNumber; i++)
    {
    foundGunItem = false
    while !foundGunItem
        {
        newGun = GenerateHandItem(choose(0,sign(irandom(global.seaLevel))))
        if ds_list_find_index(ItemRunner.melleList, newGun.itemNumber) == -1 and ds_list_find_index(ItemRunner.twoHandedList, newGun.itemNumber) == -1
            foundGunItem = true
        }
        
    with newGun
        {
        myLocation = other.id
        selected = false
        cost = itemCost
        }
        
    ds_list_add(itemList[1], newGun)
	instance_deactivate_object(newGun)
    }


///Rifle

itemList[2] = ds_list_create()
rifleNumber = irandom_range(2,5)
for(i=0; i<rifleNumber; i++)
    {
    foundGunItem = false
    while !foundGunItem
        {
        newGun = GenerateHandItem(choose(0,sign(irandom(global.seaLevel))))
        if ds_list_find_index(ItemRunner.melleList, newGun.itemNumber) == -1 and ds_list_find_index(ItemRunner.twoHandedList, newGun.itemNumber) != -1
            foundGunItem = true
        }
        
    with newGun
        {
        myLocation = other.id
        selected = false
        cost = itemCost
        }
        
    ds_list_add(itemList[2], newGun)
	instance_deactivate_object(newGun)
    }


