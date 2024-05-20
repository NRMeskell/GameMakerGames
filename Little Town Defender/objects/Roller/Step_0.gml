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
    
    sprite_index = RollerSpr   
    
    depth = - y - 2
    }
    

///Attack

if Stunned = false and place_meeting(x,y,MonsterTarget) or place_meeting(x,y,Hero) or place_meeting(x,y,Wall)
    {
    if image_index != 0 and Hit = false
        {
        image_index = 0
        Hit = true
        }
    sprite_index = RollerAttack
    image_speed = 16/60
    
    if place_meeting(x,y,Wall)
        Target = instance_nearest(x,y,Wall)
        
    if place_meeting(x,y,Hero)
        Target = instance_nearest(x,y,Hero)
    if place_meeting(x,y,MonsterTarget)
        Target = instance_nearest(x,y,MonsterTarget)
    
    if image_index div 1 = 4
        {
        with Target
            {
            Health -= other.Damage
            }
        instance_destroy()
        }
    }

///On Fire

if Fire = true
    {
    MyTower.DamageDelt += (Burn/40 * MagicRes)
    Health -= (Burn/40 * MagicRes)
    if !place_meeting(x,y,OnFire)
        instance_create(x,y,OnFire)
    }

