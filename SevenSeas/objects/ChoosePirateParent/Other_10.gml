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
    
    ds_map_clear(myPirateDict)
    ds_map_copy(myPirateDict, other.myPirateDict)
	
    myMainPer = other.myMainPer
    mySecondPer = other.mySecondPer
	
	ds_list_clear(myRequestList)
    ds_list_copy(myRequestList, other.myRequestList)
    
    EquipItem(id, other.myShirt)
    EquipItem(id, other.myPants)
    EquipItem(id, other.myHat)
    EquipItem(id, other.myRightHand)
    stars = other.stars
    myAction[0] = other.myAction[0]
    
    maxHealth = other.maxHealth
    myHealth = maxHealth
    
    event_user(0)
    }
    
//instance_destroy()
