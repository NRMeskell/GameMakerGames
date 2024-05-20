/// @description Animate

if image_index = image_number -1
    {
    if sprite_index = SwordAttackSpr
        image_xscale = choose(-1,1)
    
    if sprite_index = CannonFireSpr
        moveHeight = 10
    else
        moveHeight = irandom_range(20,30)
    moveWidth = irandom_range(-5,20)

    x = Ship.drawX + Ship.enemyMoved - sin(Ship.enemyRealRock*2*pi/360)*moveHeight + cos(Ship.enemyRealRock*2*pi/360)*moveWidth
    y = Ship.drawY + Ship.enemyWaveHeight - cos(Ship.enemyRealRock*2*pi/360)*moveHeight - sin(Ship.enemyRealRock*2*pi/360)*moveWidth
    
    attackNumber ++
    
    if attackNumber > totalAttacks and alarm[0] < 0
        {
        animate = false
        alarm[0] = room_speed*2
        }
    }

