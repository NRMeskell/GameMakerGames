/// @description Drop Ball

if instance_number(DodgeBallParent) < 12 and room != MenuRoom
    {
    with instance_create(0, 0, ballType)
        {   
        thrown = false
        
        
        //Move around room
        xdrop = random_range(100, room_width- 100)
        ydrop = random(room_height)
        global.loopBreaker = 0
        while(!physics_test_overlap(xdrop, ydrop, 0, Ground)) and (room != MenuRoom) and global.loopBreaker < 100
            {
            global.loopBreaker ++
            ydrop += 5
            
            if ydrop > room_height
                {
                xdrop = random_range(100, room_width- 100)
                ydrop = random(room_height)
                }        
            }
        
        while(physics_test_overlap(xdrop, ydrop, 0, Ground)) and (room != MenuRoom) and global.loopBreaker < 100
            {
            ydrop -= 5    
            global.loopBreaker ++
            }
        ydrop -= 50
            
        phy_position_x = xdrop
        phy_position_y = ydrop
        phy_rotation = -90
        }
    }

