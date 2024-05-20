/// @description Bounce Sound 

event_user(1)

///StrangeBounce

if phy_speed > 2
    {
    angle = irandom(360)
    bounceSpeed = phy_speed*(0.3*super)
    phy_speed_x = 0
    phy_speed_y = 0
    
    physics_apply_impulse(x + irandom_range(-5,5), y + irandom_range(-5,5), dcos(angle) * bounceSpeed, dsin(angle) * bounceSpeed)
    }