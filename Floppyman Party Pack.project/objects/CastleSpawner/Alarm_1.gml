/// @description Create CannonBall

alarm[1] = irandom_range(spawnRate, spawnRate*spawnVar)/global.timeDiff

with instance_create(choose(-50, room_width + 50), 50, CannonBall)
    {
    launchAngle = irandom_range(30, 60)
    launchPower = random_range(0.3, 0.75)
    }

