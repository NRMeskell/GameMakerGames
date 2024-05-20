/// @description Killed

if Health < 1
    {    
    if instance_exists(Bloodstone)
    with Bloodstone
        {
        if distance_to_point(other.x, other.y - other.sprite_height/2) < Range
        if Created = 1
            {
            KillBlood += MaxHealth div 5
            with instance_create(x,y,GoldDing)
                sprite_index = SkullSpr
            }
        }
    instance_destroy()
    }

///Bribed Away

if global.Bribed = true
    {
    GoTo = instance_nearest(x,y,MonsterTarget)
    GoHero = instance_nearest(x,y,Hero)
    
    if distance_to_object(GoTo) < distance_to_object(GoHero)
        {
        image_xscale = -sign(GoTo.x - x) 
        mp_potential_step(GoTo.x,GoTo.y,-Spd / 2,false)
        }
    else
        {
        image_xscale = -sign(GoHero.x - x) 
        mp_potential_step(GoHero.x,GoHero.y,-Spd / 2,false)
        }
        
    sprite_index = MySprite
    
    depth = - y - 2
    }
    

///Targeted for Workers

Targeted = false

