/// @description Swing Paths

if alarm[0] > 1
    phy_rotation -= (1-2*facingRight)*power(1+swingForce, 3)*1.9*alarm[0]/room_speed
    
if alarm[1] > 1
    phy_rotation += (1-2*facingRight)*power(1+swingForce, 3)*1.9*2*alarm[1]/room_speed
 


///Move to marker

phy_position_x = myCharacter.myMarker.x
phy_position_y = myCharacter.myMarker.y - sprite_get_height(GolfClubSpr) + 5

if point_distance(myCharacter.body.phy_position_x, myCharacter.body.phy_position_y, x, y) > 5{
    myCharacter.body.phy_position_x = x
    myCharacter.body.phy_position_y = y
    }
     

///In Sand

inSand = myCharacter.myMarker.inSand

