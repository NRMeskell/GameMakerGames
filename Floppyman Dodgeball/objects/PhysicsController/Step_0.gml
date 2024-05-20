/// @description Update Physics to game Speed

if irandom(100){
    timeDiffArr[0] = timeDiffArr[1]
    timeDiffArr[1] = timeDiffArr[2]
    timeDiffArr[2] = timeDiffArr[3]
    timeDiffArr[3] = timeDiffArr[4]
    timeDiffArr[4] = sqr(delta_time/(1/60*1000000))
    
    max(1, global.timeDiff = 0.2*(timeDiffArr[0] + timeDiffArr[1] + timeDiffArr[2] + timeDiffArr[3] + timeDiffArr[4]))
    }
    
physics_world_gravity(0, 8*global.timeDiff)
physics_world_update_speed(room_speed*2)
physics_world_update_iterations(30)
physics_world_update_speed(room_speed*2)

///Update friction

with all
    if object_get_physics(object_index){
        if phy_speed > 0
            {
            phy_speed_x -= friction * (sqrt(global.timeDiff)-1)
            phy_speed_y -= friction * (sqrt(global.timeDiff)-1)
            }
    }

