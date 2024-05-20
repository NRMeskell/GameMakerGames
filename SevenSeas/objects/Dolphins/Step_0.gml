/// @description Rotate

image_angle -= spinSpeed

if image_angle < -180
    {
    x = Ship.drawX + irandom_range(-50, 50) - 25
    y = Ship.drawY + Ship.waveHeight + irandom_range(50, 75) 
    image_angle = 180
    spinSpeed = random_range(0.8, 1.2) * 3
    }
    
if floatAway
    y += 2

