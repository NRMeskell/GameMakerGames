/// @description Move Towards Attackable

if global.Bribed = false
if Stunned = false and !place_meeting(x,y,MonsterTarget) and !place_meeting(x,y,WoodWall) and !place_meeting(x,y,StoneWall) and !place_meeting(x,y,Hero) 
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
    
    if image_index = 8 or sprite_index = ElementalAttack
        {
        sprite_index = ElementalSpr   
        image_speed = 8/60
        }
    
    depth = - y - 2
    }
    

///Attack

if Stunned = false and place_meeting(x,y,MonsterTarget) or place_meeting(x,y,Hero) or place_meeting(x,y,Wall)
    {
    sprite_index = ElementalAttack
    image_speed = 8/60
    
    if place_meeting(x,y,Wall)
        Target = instance_nearest(x,y,Wall)
        
    if place_meeting(x,y,Hero)
        Target = instance_nearest(x,y,Hero)
    if place_meeting(x,y,MonsterTarget)
        Target = instance_nearest(x,y,MonsterTarget)
    
    if image_index div 1 = 6
    if Attacking = false
        {
        with instance_create(x,y,ElementalSmash)
            {
            Target = other.Target
            direction = point_direction(x,y, Target.x, Target.y)
            }
        Attacking = true
        }
            
    if image_index div 1 = 4
        Attacking = false
    }

///On Fire

if Fire = true
    {
    MyTower.DamageDelt += (Burn/40 * MagicRes)
    Health -= (Burn/40 * MagicRes)
    if !place_meeting(x,y,OnFire)
        instance_create(x,y,OnFire)
    }

