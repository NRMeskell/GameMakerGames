/// @description Move to auto slot

item[0] = myShirt
item[1] = myHat
item[2] = myPants
item[3] = myLeftHand
item[4] = myRightHand
item[5] = myPet

for(i=0; i<9; i++)
    {
    bonus[i] = 0
    for(r=0; r<array_length_1d(item); r++)
        if r != 3 or !item[r].twoHanded
            bonus[i] += item[r].bonus[i]
    }

for(i=0; i<9; i++)
    statTotal[i] = stat[i] + bonus[i]
    
mySlot.occupied = false
slotFound = false

for(i=0; i<instance_number(ShipSlot) and !slotFound; i++)
    {
    mySlot = instance_find(ShipSlot, i)
    if (mySlot.occupied = false and mySlot.xSpot[Ship.shipType] != -50 and mySlot.myLayer != 2)
        if (statTotal[2] > 0 and mySlot.slotType == "cannon") or (statTotal[3] > 0 and mySlot.slotType == "rigging") or (statTotal[5] > 0 and mySlot.slotType == "wheel") or (statTotal[6] > 0 and mySlot.slotType == "medical")
            slotFound = true
    }

if !slotFound
    while (mySlot.occupied = true or mySlot.xSpot[Ship.shipType] = -50 or mySlot.myLayer = 2) or mySlot.slotType == "bed"
        {
        mySlot = instance_find(ShipSlot, random(instance_number(ShipSlot)-1))
        } 
        
mySlot.occupied = true
mySlot.myThing = id
myMainSlot = mySlot


