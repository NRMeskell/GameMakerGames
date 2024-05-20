/// @description Physics

timeDiffArr[0] = 1
timeDiffArr[1] = 1
timeDiffArr[2] = 1
timeDiffArr[3] = 1
timeDiffArr[4] = 1
global.timeDiff = 0.2*(timeDiffArr[0] + timeDiffArr[1] + timeDiffArr[2] + timeDiffArr[3] + timeDiffArr[4])


physics_world_create(1/64)
physics_world_gravity(0,8)
physics_world_update_iterations(30)
physics_world_update_speed(room_speed*2*global.timeDiff)

