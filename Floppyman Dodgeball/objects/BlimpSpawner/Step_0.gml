/// @description Move Blimp

place += boatSpeed

if place > 2*pi
    place = 0

if is_array(blimp) and (y != ((yPos + sin(place)*boatHeight) div 1)) {
    y = yPos + sin(place)*boatHeight
    
    for(i=0; i<array_length_1d(blimp); i++)
        with blimp[i]
            {
            if other.i < 6 and other.i != 5
                phy_position_y = other.y
            else
                phy_position_y = other.y+97
            }
            
    with DodgeBallParent
        if phy_speed_y = 0
            phy_position_y += 0
        
}

