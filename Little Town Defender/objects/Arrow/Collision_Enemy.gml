/// @description Hit
    
if Damage < 0
    Damage = 0
        
if other.object_index != Skeleton
    other.Health -= Damage

if Stun = true
    {
    other.Stunned = true
    other.alarm[3] = 80
    }

if Pierce = false
    instance_destroy()
    
with MyTower
    DamageDelt += Damage

