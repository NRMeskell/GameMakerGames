/// @description Create Carts and Move to position

path_position = myStartPos

myLift = instance_create(x,y,SkiLiftChair)
with myLift
    {
    physics_joint_revolute_create(id, other, x, y, -30, 30, true, 10, 10, false, false)
    }
    


