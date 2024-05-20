/// @description Move Towards Attackable

if global.Bribed = false
if Stunned = false and distance_to_object(MonsterTarget) > 75 and !place_meeting(x,y,Wall) and distance_to_object(Hero) > 75
    {
    GoTo = instance_nearest(x,y,MonsterTarget)
    GoHero = instance_nearest(x,y,Hero)
    
    if distance_to_object(GoTo) < distance_to_object(GoHero)
        {
        image_xscale = sign(GoTo.x - x) 
        mp_potential_step(GoTo.x,GoTo.y,Spd,false)
        }
    else
        {
        image_xscale = sign(GoHero.x - x) 
        mp_potential_step(GoHero.x,GoHero.y,Spd,false)
        }
    
    sprite_index = ImpSpr   
    
    depth = - y - 2
    }
    

///Attack

if Stunned = false and (distance_to_object(MonsterTarget) <= 75 or place_meeting(x,y,WoodWall) or place_meeting(x,y,StoneWall) or distance_to_object(Hero) <= 75)
    {
    image_speed = 8/60
    
    if distance_to_object(Wall) <= 75
        Target = instance_nearest(x,y,Wall)
        
    if distance_to_object(MonsterTarget) <= 75
        Target = instance_nearest(x,y,MonsterTarget)
        
    if distance_to_object(Hero) <= 75
        Target = instance_nearest(x,y,Hero)
    
    if image_index div 1 = 15
    if Firing = false
        with instance_create(x, y - sprite_height/2, EnemyFire)
            {
            Damage = other.Damage
            move_towards_point(other.Target.x, other.Target.y, 8)
            other.Firing = true
            image_angle = direction
            }
            
    if image_index div 1 = 10
        Firing = false
    }

///On Fire

/*
if Fire = true
    {
    Health -= (Burn/40 * MagicRes)
    if !place_meeting(x,y,OnFire)
        instance_create(x,y,OnFire)
    }

/* */
/*  */
