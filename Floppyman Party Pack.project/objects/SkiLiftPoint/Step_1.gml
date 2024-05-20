/// @description restart path

if alarm[0] < 0
if path_position < 0.05
    with myLift
        {
        x = other.x
        y = other.y
        phy_rotation = 0
        phy_angular_velocity = 0
        }

