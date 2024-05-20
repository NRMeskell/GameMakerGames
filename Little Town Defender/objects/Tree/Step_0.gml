/// @description Destroyed by Worker

if Health < 1
    {
    with Worker
        if Target = other
        if distance_to_object(Target) < 3
            {
            Target = MyHouse
            if other.image_index = 5
                HaveResource = "Rock"
            else
                HaveResource = "Tree"
            }
            
    ///Spawn An Ent        
    if instance_exists(MonsterInfo)
    if image_index != 5
    with MonsterInfo
        {
        if image_index = 11
            {
            Direction = choose(1,2,3,4)

            if Direction = 1
                {
                Height = random_range(288, room_height)
                instance_create(-32, Height, Monster)
                }
                
            if Direction = 2 or Direction = 3
                {
                Width = random_range(200, room_width-200)
                instance_create(Width, room_height + 32, Monster)
                }
                
            if Direction = 4
                {
                Height = random_range(288, room_height)
                instance_create(room_width + 32, Height, Monster)
                }
            }
        }
            
    instance_destroy()
    }

