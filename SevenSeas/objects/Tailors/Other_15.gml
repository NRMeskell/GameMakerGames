/// @description Hats

itemList[0] = ds_list_create()

hatNumber = irandom_range(2,5)
for(i=0; i<hatNumber; i++)
    {
    newHat = GenerateHatItem(choose(0,sign(irandom(global.seaLevel)))) 
    with newHat
        {
        myLocation = other.id
        selected = false
        cost = itemCost
        }
        
    ds_list_add(itemList[0], newHat)
	instance_deactivate_object(newHat)
    }


///Shirts

itemList[1] = ds_list_create()

shirtNumber = irandom_range(2,5)
for(i=0; i<shirtNumber; i++)
    {
    newShirt = GenerateShirtItem(choose(0,sign(irandom(global.seaLevel)))) 
    with newShirt
        {
        myLocation = other.id
        selected = false
        cost = itemCost
        }
        
    ds_list_add(itemList[1], newShirt)
	instance_deactivate_object(newShirt)
    }


///Pants

itemList[2] = ds_list_create()

pantsNumber = irandom_range(2,5)
for(i=0; i<pantsNumber; i++)
    {
    newPants = GeneratePantsItem(choose(0,sign(irandom(global.seaLevel)))) 
    with newPants
        {
        myLocation = other.id
        selected = false
        cost = itemCost
        }
        
    ds_list_add(itemList[2], newPants)
	instance_deactivate_object(newPants)
    }


