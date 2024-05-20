/// @description Killed

if Health < 1
    {
    instance_destroy()
    }

///Run Away

GoTo = MyHouse
NotHouse = false

if distance_to_object(Enemy) <= Range/2 + 1 and distance_to_object(Enemy) > Spd
    {
    GoTo = instance_nearest(x,y,Enemy)
    image_speed = 8/60
    
    if distance_to_object(Enemy) < Range/2
        mp_potential_step(GoTo.x, GoTo.y, -Spd, false)
    
    image_xscale = sign(x-GoTo.x)
    }

///Heal

HealAmount = 1

if GoTo != instance_nearest(x,y,Enemy)
{
if instance_exists(Heal)
{
if Heal.Health >= Heal.MaxHealth
    {
    if instance_exists(MonsterTarget)
    for(i=0; i<instance_number(MonsterTarget); i++)
        {
        Heal = instance_find(MonsterTarget, i)
        
        if Heal.Health/Heal.MaxHealth < HealAmount
            {
            GoTo = Heal
            NotHouse = true
            HealAmount = Heal.Health/Heal.MaxHealth
            }
        }
    
    if instance_exists(Wall)
    for(i=0; i<instance_number(Wall); i++)
        {
        Heal = instance_find(Wall, i)
        
        if Heal.Health/Heal.MaxHealth < HealAmount
            {
            GoTo = Heal
            NotHouse = true
            HealAmount = Heal.Health/Heal.MaxHealth
            }
        }
    }
else
    {
    Heal = TownHall
    }
}
/*
if instance_exists(Hero)
for(i=0; i<instance_number(Hero); i++)
    {
    Heal = instance_find(Hero, i)
    
    if Heal.id != id
    with Heal
        {
        if Health < MaxHealth and distance_to_object(other.MyHouse) < other.SightRange
            {
            other.GoTo = id
            other.NotHouse = true
            }
        }
    
    }*/
    
if point_distance(x,y,GoTo.x,GoTo.y) > Spd
    {
    image_speed = 8/60
    mp_potential_step(GoTo.x, GoTo.y, Spd, false)
    sprite_index = HealerSpr
    image_xscale = sign(GoTo.x-x)
    }
else
    {
    image_speed = 0
    image_index = 0
    
    if NotHouse == true
        {
        image_speed = 8/60
        sprite_index = HealerHeal
        GoTo.Health += Healing
        }
    }
    
depth = -y - 1

}


/* */
///Level Up

if Points < instance_number(House) div 10 and Points < 2
for(i=0; Points<instance_number(House) div 10; Points++)
    {
    LevelUp = choose("Heal", "Speed", "Health")
    
    if LevelUp = "Speed"
        {
        Spd += 0.2
        SightRange += 100
        if Special = ""
            Special = "Fast"
        else
            Special2 = "Fast"
        }
        
    if LevelUp = "Health"
        {
        MaxHealth += 10
        if Special = ""
            Special = "Tough"
        else
            Special2 = "Tough"
        }
    if LevelUp = "Heal"
        {
        Healing += 0.2
        if Special = ""
            Special = "Fast Aid"
        else
            Special2 = "Fast Aid"
        }
    }

/* */
/*  */
