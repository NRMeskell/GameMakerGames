/// @description Pirates
itemList[0] = ds_list_create()
pirateNumber = irandom_range(2,4)
for(i=0; i<pirateNumber; i++)
    {
    newPirate = instance_create(0,0,StoreObjectPirate)
    newPirate.myLocation = id
    with newPirate
        {   
		cost = 20
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
        
        
        EquipItem(id, MakeRandomShirtItem(irandom(global.seaLevel div 2) + irandom_range(-1, 0)))
        cost += round(myShirt.cost*.5)
        
        EquipItem(id, MakeRandomPantsItem((irandom(global.seaLevel div 2) + irandom_range(-1, 0))))
        cost += round(myPants.cost*.5)
        
		repeat(min(0, irandom(global.seaLevel) - 1)){
			PirateLevelUp(false, false)
			cost += 25
		}
		
        if irandom(3) > 0
            {
			handItem = MakeRandomHandItem(0)
            if EquipItem(id, handItem)
                cost += handItem.cost*0.5
            }
            
        selected = false
        cost = cost div 1
		}
    ds_list_add(itemList[0], newPirate)
	with newPirate{
		instance_deactivate_object(myHat)
		instance_deactivate_object(myShirt)
		instance_deactivate_object(myPants)
		instance_deactivate_object(myPet)
		instance_deactivate_object(myRightHand)
		instance_deactivate_object(myLeftHand)
		}
	instance_deactivate_object(newPirate)
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
        itemNumber = choose(4,6)
        if itemNumber = 4
            amount = irandom_range(3,10)
        else
            amount = irandom_range(2,5)
        cost = ItemRunner.cargoCost[itemNumber] + irandom(2) + ItemRunner.cargoCost[itemNumber]*amount        
        selected = false
        }
        
    ds_list_add(itemList[1], newFood)
	instance_deactivate_object(newFood)
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
	instance_deactivate_object(newGrog)
    }

