/// @description Move Towards Attackable

depth = - y - 1

if instance_exists(Enemy)
    {
    GoTo = instance_nearest(x,y,Enemy)
    if point_distance(MyHouse.x, MyHouse.y, GoTo.x, GoTo.y) <= SightRange
        {
        image_speed = 8/60
        
        if distance_to_object(GoTo) > Range
            {
            mp_potential_step(GoTo.x,GoTo.y,Spd,false)
            sprite_index = ArcherSpr   
            image_xscale = sign(GoTo.x - x) 
            }
        
        Working = true
        }
    else 
        Working = false
    }
else
    Working = false
    

///Attack

if instance_exists(Enemy)
{
GoTo = instance_nearest(x,y,Enemy)
if (distance_to_object(GoTo) <= Range and distance_to_object(GoTo) >= Range/2) or (distance_to_object(GoTo) < Spd + 2)
    {
    sprite_index = ArcherAttack
    image_speed = 8/60
    
    if image_index div 1 = 3
        {
        if Fired = false
            {
            Fired = true
            Target = instance_nearest(x,y,Enemy)
                
            with instance_create(x,y - 10,Arrow)
                {
                MyTower = other
                MyHero = instance_nearest(x,y,Archer)
                MyHero.Target = instance_nearest(x,y,Enemy)
                //Fire
                direction = point_direction(x,y,MyHero.Target.x,MyHero.Target.y - MyHero.Target.sprite_height/4)
                image_angle = direction
                move_towards_point(MyHero.Target.x,MyHero.Target.y - MyHero.Target.sprite_height/4,MyHero.FireSpeed)
                alarm[1] = MyHero.Range/MyHero.FireSpeed
                
                //Arrow Specialities
                Damage = MyHero.Damage
                Health = 1
                Punch = MyHero.Punch
                Pierce = MyHero.Pierce
                Stun = MyHero.Stun
                }
            }
        }
    else
        Fired = false
    }
}

///Killed

if Health < 1
    {
    instance_destroy()
    }

///Go Home

if (Working = false or distance_to_object(MyHouse) > 250)
    {
    image_speed = 8/60
    mp_potential_step(MyHouse.x, MyHouse.y, Spd, false)
    sprite_index = ArcherSpr
    if sign(MyHouse.x - x) != 0
        {
        image_xscale = sign(MyHouse.x - x) 
        }
    else
        image_speed = 0
    }

/*///Run Away

Run = false

if distance_to_object(Enemy) <= Range/2 and distance_to_object(Enemy) > Spd
    {
    Run = true
    image_speed = 8/60
    mp_potential_step(GoTo.x, GoTo.y, -Spd, false)
    sprite_index = ArcherSpr
    }

/* */
/*  */
