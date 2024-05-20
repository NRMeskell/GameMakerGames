/// @description Moving

if moving != 0
    {
    if y < maxLevel
        {
        moving = 0
        phy_position_y = maxLevel
        }
    else if y > minLevel
        {
        moving = 0
        phy_position_y = minLevel
        }
        
    phy_position_y += moving*bridgeSpeed*sqrt(global.timeDiff )
        
    with DodgeBallParent
        if phy_speed_y = 0 and abs(x-room_width/2) < BridgeBridge.sprite_width/2
            phy_position_y += BridgeBridge.moving*BridgeBridge.bridgeSpeed*sqrt(global.timeDiff)
    }

