/// @description Grab a random item

if Health < 1
    {
    with instance_nearest(x,y,Worker)
        if Task = "Rock"
            {
            Resource = irandom(9)
            if Resource = 3
                HaveResource = "Gold"
            else
                HaveResource = "Rock"
                
            Working = false
            }
    
    Health = MaxHealth
    }

