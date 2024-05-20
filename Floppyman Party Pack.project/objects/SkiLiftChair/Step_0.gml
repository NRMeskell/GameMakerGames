/// @description Don't glitch

if phy_angular_velocity == 0
    physics_apply_angular_impulse(0.0001)

