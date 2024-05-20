/// @description free player

//look for good release place
placeFound = false  
distance = 1  
while !placeFound{
    for(i=0; i<360; i+= 45){
        if !collision_circle(x + dcos(i)*distance, y+dsin(i)*distance, sprite_get_height(BodySpr)/2, Ground, true, true){
            placeX = x + dcos(i)*distance
            placeY = y + dsin(i)*distance
            placeFound = true
            break
        }       
    distance ++
    }
}

//release player
with myCharacter{
    golfHitting = false
    golfSwinging = false
    golfStrike = false
    
    checkRad = 0
    
    for(i=0; i<array_length_1d(bodyPart); i++)
        with bodyPart[i]
             {
             phy_speed_x = 0
             phy_speed_y = 0
             phy_angular_velocity = 0
             phy_position_x = myCharacter.myClub.placeX
             phy_position_y = myCharacter.myClub.placeY
             phy_rotation = 0
             }
    }
        
instance_destroy()



