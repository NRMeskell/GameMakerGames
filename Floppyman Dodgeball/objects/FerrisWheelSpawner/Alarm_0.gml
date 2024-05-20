/// @description Spawn Terrain

n = 10

instance_create(x,y,FerrisWheelStand)
instance_create(x,y,FerrisWheelCircle)

for(i=0; i<n; i++)
    {
    spoke[i] = instance_create(x, y, FerrisWheelSpoke)
    with spoke[i]
        {
        phy_rotation = other.i*(360/other.n)
        if other.i % 2 = 0
            with instance_create(x + cos(degtorad(other.i*(360/other.n)))*sprite_get_width(FerrisWheelSpokeSpr), y + sin(degtorad(other.i*(360/other.n)))*sprite_get_width(FerrisWheelSpokeSpr), FerrisWheelCar)
                {
                physics_joint_revolute_create(id, other, x, y, 0, 360, false, 10, 10, false, false)
                with instance_create(x,y,FerrisWheelLeftWall)
                    myCart = other
                with instance_create(x,y,FerrisWheelRightWall)
                    myCart = other
                }
        }
    }

