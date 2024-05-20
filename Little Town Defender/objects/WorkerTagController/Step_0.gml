/// @description WorkerTag

if instance_exists(WorkerTag)
{
for(i = 0; i < instance_number(WorkerTag); i++)
    {
    CurrentTag = instance_find(WorkerTag, i)

    //odd
    if instance_number(WorkerTag) % 2 = 1
    CurrentTag.x = room_width div 2 - (instance_number(WorkerTag) - 1) div 2 * Distance + i * Distance
    
    //even
    if instance_number(WorkerTag) % 2 = 0
    CurrentTag.x = room_width div 2 - (instance_number(WorkerTag)) div 2 * Distance + i * Distance + Distance/2
    }
}

