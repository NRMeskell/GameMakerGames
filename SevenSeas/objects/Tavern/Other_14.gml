/// @description Pirates
itemList[0] = ds_list_create()
pirateNumber = irandom_range(2,4)
for(i=0; i<pirateNumber; i++)
    {
    newPirate = instance_create(0,0,StoreObjectPirate)
    newPirate.myLocation = id
    with newPirate
        {   
		cost = 30
        limbsLost = choose(0,0,0,0,1,1,2)
        for(r=0; r<limbsLost; r++){
            myLimb = irandom(5)
            if myLimb = 0
                eyeLostRight = true
            if myLimb = 1
                eyeLostLeft = true
            if myLimb = 2
                handLostRight = true
            if myLimb = 3 
                handLostLeft = true
            if myLimb = 4
                legLostRight = true
            if myLimb = 5
                legLostLeft = true
                
            cost -= irandom_range(7,10)
            }
        
        
        myShirt = MakeRandomShirtItem(irandom_range(-1,0))
        cost += round(myShirt.cost*.75)
        
        myPants = MakeRandomPantsItem(-1)
        
        myHat = MakeRandomHatItem(-1)
        
        if irandom(1)
            {
			handItem = MakeRandomHandItem(0)
            if EquipItem(id, handItem)
                cost += handItem.cost*0.75
            }
            
        selected = false
        cost = cost div 1
		}
    ds_list_add(itemList[0], newPirate)
    }


///Food
itemList[1] = ds_list_create()
foodNumber = irandom_range(2,6)
for(i=0; i<foodNumber; i++)
    {
    newFood = instance_create(0,0,StoreObjectStorable)
    newFood.myLocation = id
    with newFood
        {        
        itemNumber = choose(4,5,6)
        if itemNumber = 4
            amount = irandom_range(3,10)
        else
            amount = irandom_range(2,5)
        cost = ItemRunner.cargoCost[itemNumber] + irandom(2) + ItemRunner.cargoCost[itemNumber]*amount        
        selected = false
        }
        
    ds_list_add(itemList[1], newFood)
    }

///Rum
itemList[2] = ds_list_create()
rumNumber = irandom_range(1,4)
for(i=0; i<rumNumber; i++)
    {
    newGrog = instance_create(0,0,StoreObjectStorable)
    newGrog.myLocation = id
    with newGrog
        {        
        itemNumber = 5
        amount = irandom_range(1,5)
        cost = ItemRunner.cargoCost[itemNumber] + irandom(2) + ItemRunner.cargoCost[itemNumber]*amount        
        selected = false
        }
        
    ds_list_add(itemList[2], newGrog)
    }

