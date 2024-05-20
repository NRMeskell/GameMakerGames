/// @description Create Food

alarm[0] = 60
GetFood = 0

if HasFood < 100 and instance_exists(Farm) and Created = true
    {
    for(i = 0; i <= instance_number(Farm); i ++)  //Go through all trees
        with instance_find(Farm,i) //Run with all trees
            {
            if point_distance(other.x,other.y-8,x,y-8) < other.Range and Created = true
                {
                other.GetFood += 0.1
                }
            }
            
    HasFood += GetFood
    }
    
if HasFood > 100
    {
    HasFood = 100
    }

