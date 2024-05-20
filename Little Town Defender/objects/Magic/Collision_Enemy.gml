/// @description Hit

with MyTower
    DamageDelt += Damage

if other.id != MyFire
{
if Stun = true
    {
    other.Stunned = true
    other.alarm[3] = 80
    }
    
Damage -= other.MagicArmor
    
if Damage < 0
    Damage = 0
    
other.Health -= Damage

Health -= 1

if Fire = true
    {
    other.MyTower = MyTower
    other.alarm[2] = FireTime
    other.Fire = true
    other.Burn = Burn
    
    if Burn == 2
    if other.Armor > 1
        other.Armor -= 1
    
    for(i=0; i<360; i+=30)
        {
        with instance_create(x,y,Explotion)
            {
            Damage = 2
            alarm[0] = 2
            direction = other.i
            image_angle = other.i - 90
            motion_set(other.i,8)
            FireTime = other.FireTime
            MyTower = other.MyTower
            }
        }
    }
    
if Explode = true
    {
    for(i=0; i<360; i+=30)
        {
        with instance_create(x,y,Explotion)
            {
            alarm[0] = 12
            direction = other.i
            image_angle = other.i - 90
            motion_set(other.i,8)
            FireTime = other.FireTime
            Damage = other.Damage
            
            MyTower = other.MyTower
            }
        }
    }
    
if Light = true
    {            
    for(i=0; i< instance_number(Enemy); i++)
    {
    MyTarget = instance_find(Enemy,i)
    
    if MyTarget.id != other.id
    if abs(point_direction(x, y, MyTarget.x, MyTarget.y) - direction) < LightDirection
    if distance_to_object(MyTarget) < LightRange
        {
        i = instance_number(Enemy)
        if other.sprite_index !=Dragon
        with instance_create(other.x,other.y - other.sprite_height/2, Magic)
            {        
            direction = other.direction
            
            MyFire = instance_nearest(x,y,Enemy)
            
            move_towards_point(other.MyTarget.x, other.MyTarget.y - (other.MyTarget.sprite_height)/2, 10)
            
            Damage = other.Damage * 3/4
            Health = 1
            Fire = false
            Light = true
            FireTime = 0
            Explode = false
            Burn = 0
            LightDirection = other.LightDirection
            LightRange = other.LightRange
            Stun = other.Stun
            
            MyTower = other.MyTower
            
            alarm[2] = point_distance(other.MyTarget.x, other.MyTarget.y, x, y)/5
            }
        }
    }
    }
}

if Health < 1
    instance_destroy()

