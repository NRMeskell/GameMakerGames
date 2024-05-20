/// @description Launch


//physics_apply_torque(irandom_range(-2, 2))
physics_apply_impulse(x, y, (-1+ 2*(x < 0))*sqrt(global.timeDiff)*launchPower*cos(degtorad(launchAngle)),  -launchPower*sqrt(global.timeDiff)*sin(degtorad(launchAngle)))

phy_rotation = -launchAngle-90*(x < 0)

