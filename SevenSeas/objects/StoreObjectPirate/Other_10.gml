/// @description Create Pirate

with CreatePirate(false)
    {
    firstName = other.firstName
    lastName = other.lastName
    name = other.name
    
    mySkin = other.mySkin
    myFace = other.myFace
    
    myGender = other.myGender
    body = other.body
    face = other.face
    skinColor = other.skinColor
    beard = other.beard
    hair = other.hair
    hairColor = other.hairColor
    
    eyesLost = other.eyesLost
    eyeLostRight = other.eyeLostRight
    eyeLostLeft = other.eyeLostLeft
    
    handLostRight = other.handLostRight 
    handLostLeft = other.handLostLeft
    
    legLostRight = other.legLostRight
    legLostLeft = other.legLostLeft
    
    legsLost = other.legsLost
	
	myMainPer = other.myMainPer
	mySecondPer = other.mySecondPer
    
    ds_map_clear(myPirateDict)
    ds_map_copy(myPirateDict, other.myPirateDict)
    
    EquipItem(id, other.myShirt)
    EquipItem(id, other.myPants)
    EquipItem(id, other.myHat)
    EquipItem(id, other.myRightHand)
	
	maxHealth = other.maxHealth
	myHealth = other.myHealth
    
    event_user(0)
    }
    
ds_list_delete(myStore.items, ds_list_find_index(myStore.items, id))
LoseCargo(0, cost)


instance_destroy()

