/// @description Destroyed by Worker

if Health < 1
    {
    with Worker
        if Target = other
        if point_distance(x,y,other.x,other.y) < 3
            {
            Target = MyHouse
            if other.image_index = 0
                HaveResource = "Tree"
            if other.image_index = 1
                HaveResource = "Rock"
            if other.image_index = 2
                HaveResource = "Gold"
                
                
            with other
                instance_destroy()
            }
    }

