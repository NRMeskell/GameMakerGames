/// @description Add Monsters

if PlayerLevel <= 2
    MonsterLevel = PlayerLevel
    
if PlayerLevel > 2
    MonsterLevel = PlayerLevel + choose(0,1)

if MonsterLevel <= 2
    {
    with instance_create(18, 530, MonsterInfo)
        image_index = 0
    }
   
if MonsterLevel = 3 or MonsterLevel = 4
    {
    with instance_create(18, 530, MonsterInfo)
        image_index = 1
    }
    
if MonsterLevel = 5
    {
    with instance_create(18, 530, MonsterInfo)
        image_index = 2
    }
    
if MonsterLevel = 6
    {
    with instance_create(18, 530, MonsterInfo)
        image_index = 3
    }
    
if MonsterLevel = 7
    {
    with instance_create(18, 530, MonsterInfo)
        image_index = 4
    }
    
if MonsterLevel = 8
    {
    with instance_create(18, 530, MonsterInfo)
        image_index = 5
    }
    
if MonsterLevel = 9
    {
    with instance_create(18, 530, MonsterInfo)
        image_index = 9
    }
    
if MonsterLevel = 10
    {
    with instance_create(18, 530, MonsterInfo)
        image_index = 6
    }
    
if MonsterLevel = 11
    {
    with instance_create(18, 530, MonsterInfo)
        image_index = 8
    }        
    
if MonsterLevel >= 12
    {
    with instance_create(18, 530, MonsterInfo)
        image_index = choose(7,10,11,12)
    }
    
     
PlayerLevel += 1

MonsterSpawnRate = room_speed * power(PlayerLevel, 3/7) * 60 * (global.LevelSelect+5)/3

alarm[0] = MonsterSpawnRate


