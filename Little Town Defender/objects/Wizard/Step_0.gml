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
            sprite_index = WizardSpr   
            image_xscale = sign(GoTo.x - x) 
            }
        
        Working = true
        }
    else 
        Working = false
    }
else
    Working = false
    

/*///Attack

if instance_exists(Enemy)
{
GoTo = instance_nearest(x,y,Enemy)
if (distance_to_object(GoTo) <= Range and distance_to_object(GoTo) >= Range/2) or (distance_to_object(GoTo) < Spd + 2)
    {
    sprite_index = WizardAttack
    image_speed = 8/60
    
    if alarm[0] <= 0
        {
        Fired = true
        Target = instance_nearest(x,y,Enemy)
            
        with instance_create(x, y - 5, Magic)
            {
            MyHero = instance_nearest(x,y,Hero)
            MyHero.Target = instance_nearest(x,y,Enemy)
            
            //Fire
            direction = point_direction(x,y,other.Target.x,other.Target.y - other.Target.sprite_height/4)
            image_angle = direction
            move_towards_point(other.Target.x,other.Target.y - other.Target.sprite_height/4,other.FireSpeed)
            alarm[2] = other.Range/other.FireSpeed
            MyFire = other
            
            //Arrow Specialities
            Damage = other.Damage
            Health = 1
            Fire = other.Fire
            Light = other.Light
            FireTime = other.FireTime
            Explode = other.Explode
            Burn = other.Burn
            LightDirection = other.LightDirection
            LightRange = other.LightRange
            Stun = other.Stun
            }
        alarm[0] = 90
        }
    else
        Fired = false
    }
}

/* */
///Fire

if instance_exists(Enemy)
if TownHall.visible = true
{
Target = instance_nearest(x,y,Enemy)

if alarm[0] <= 1 and distance_to_object(Target) < Range
    {
    if ManyArrow == false
    with instance_create(x,y - 5,Magic)
        {
        //Fire
        if other.Target.sprite_index == DragonBody
            direction = point_direction(x,y,other.Target.x,other.Target.y + other.Target.sprite_height/2)
        else
            direction = point_direction(x,y,other.Target.x,other.Target.y - other.Target.sprite_height/4)
        
        image_angle = direction
        motion_set(direction,other.FireSpeed)
        alarm[2] = other.Range/other.FireSpeed + 5
        MyFire = other
        
        //Arrow Specialities
        Damage = other.Damage + other.Damage * global.BloodBonus
        Health = 1
        Fire = other.Fire
        Light = other.Light
        FireTime = other.FireTime
        Explode = other.Explode
        Burn = other.Burn
        LightDirection = other.LightDirection
        LightRange = other.LightRange
        Stun = other.Stun
        
        MyTower = other.id
        }
        
    MySound = audio_play_sound(MagicSnd, 0, false)
    alarm[0] = FireRate
    }
}

/* */
///Killed

if Health < 1
    {
    instance_destroy()
    }

/* */
///Go Home

if (Working = false or distance_to_object(MyHouse) > 250)
    {
    image_speed = 8/60
    mp_potential_step(MyHouse.x, MyHouse.y, Spd, false)
    sprite_index = WizardSpr
    if sign(MyHouse.x - x) != 0
        {
        image_xscale = sign(MyHouse.x - x) 
        }
    else
        image_speed = 0
    }

/* */
/*///Run Away

if distance_to_object(Enemy) <= Range/2 and distance_to_object(Enemy) > Spd
    {
    image_speed = 8/60
    mp_potential_step(GoTo.x, GoTo.y, -Spd, false)
    sprite_index = WizardSpr
    }

/* */
/*  */
