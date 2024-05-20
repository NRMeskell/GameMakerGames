/// @description Move Towards Attackable

depth = - y - 1

if instance_exists(Enemy)
    {
    GoTo = instance_nearest(x,y,Enemy)
    if !place_meeting(x,y,Enemy) and point_distance(MyHouse.x, MyHouse.y, GoTo.x, GoTo.y) < SightRange
        {
        image_speed = 8/60
        mp_potential_step(GoTo.x,GoTo.y,Spd,false)
        
        sprite_index = WarriorSpr   
        
        image_xscale = sign(GoTo.x - x) 
        
        Working = true
        }
    else 
        Working = false
    }
else
    Working = false
    

///Attack

if place_meeting(x,y,Enemy)
    {
    sprite_index = WarriorAttack
    image_speed = 8/60

    Target = instance_nearest(x,y,Enemy)
    
    if image_index div 1 = 5
        {
        if Attacking = false
            {
            if sprite_index = WarriorAttack
                {
                Target.Health -= other.Damage
                Attacking = true
                }
            }
        }
    else
        Attacking = false
    }

///Killed

if Health < 1
    {
    instance_destroy()
    }

///Go Home

if (Working = false or distance_to_object(MyHouse) > 250) and !place_meeting(x,y,Enemy) and !(place_meeting(x,y,Healer) and Health < MaxHealth)
    {
    image_speed = 8/60
    mp_potential_step(MyHouse.x, MyHouse.y, Spd, false)
    sprite_index = WarriorSpr
    if sign(MyHouse.x - x) != 0
        {
        image_xscale = sign(MyHouse.x - x) 
        }
    else
        image_speed = 0
    }

