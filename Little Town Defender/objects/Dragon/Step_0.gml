/// @description Move Towards Attackable

GoTo = instance_nearest(x,y,MonsterTarget)
GoHero = instance_nearest(x,y,Hero)

image_xscale = sign(GoTo.x - x) 

if Stunned = false and distance_to_object(MonsterTarget) > 100 and !place_meeting(x,y,Wall) and distance_to_object(Hero) > 100
    {
    if distance_to_object(GoTo) < distance_to_object(GoHero)
        {
        mp_potential_step(GoTo.x,GoTo.y,Spd,false)
        }
    else
        {
        mp_potential_step(GoHero.x,GoHero.y,Spd,false)
        }
    
    sprite_index = DragonBody  
    
    depth = - y - 2
    
    image_speed = 15/60
    }
    

///Attack

if Stunned = false and (distance_to_object(MonsterTarget) <= 100 or place_meeting(x,y,WoodWall) or place_meeting(x,y,StoneWall) or distance_to_object(Hero) <= 100)
    {
    AttackUsed = choose("FireBall", "Spray")
    
    if distance_to_object(Wall) <= 100
        Target = instance_nearest(x,y,Wall)
        
    if distance_to_object(MonsterTarget) <= 100
        Target = instance_nearest(x,y,MonsterTarget)
        
    if distance_to_object(Hero) <= 100
        Target = instance_nearest(x,y,Hero)
    
    if image_index div 1 = 15 or image_index div 1 = 8
    if AttackUsed = "FireBall"
    if Firing = false
        {
        HeadLength = 26
            {
            repeat(3)
            with instance_create(x + cos(HeadDir*pi/180)*HeadLength, y - sin(HeadDir*pi/180)*HeadLength, EnemyFire)
                {
                Damage = other.Damage
                move_towards_point(other.Target.x, other.Target.y, 8)
                other.Firing = true
                image_angle = direction
                image_xscale = 2
                image_yscale = image_xscale
                }
            }
        }
        
    if image_index div 1 = 15 or image_index div 1 = 8
    if AttackUsed = "Spray"
    if Firing = false
        {
        HeadLength = 26
            {
            for(i=-20; i < 25; i += 20)
            with instance_create(x + cos(HeadDir*pi/180)*HeadLength, y - sin(HeadDir*pi/180)*HeadLength, EnemyFire)
                {
                Damage = other.Damage
                move_towards_point(other.Target.x, other.Target.y, 8)
                direction += other.i
                other.Firing = true
                image_angle = direction
                image_xscale = 1.5
                image_yscale = image_xscale
                }
            }
        }
            
    if image_index div 1 = 10
        Firing = false
    }

///Killed

if Health <= 0
    {
    instance_destroy()
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
///Unstun Faster

if alarm[3] >= 2
    alarm[3] -= 2

/* */
/*  */
