/// @description Create Carts and Move to position

path_position = myStartPos

with instance_create(x,y,FactoryCar)
    {
    physics_joint_revolute_create(id, other, x, y, -10, 10, true, 10, 10, false, false)
    }
    


