/// @description Rolling

if !place_meeting(x,y+1, Ground)
    physics_apply_force(x,y,0,20*(global.timeDiff))
        
if phy_speed < 1
    thrown = false

