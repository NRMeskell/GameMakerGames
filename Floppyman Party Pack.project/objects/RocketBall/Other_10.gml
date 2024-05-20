/// @description Lock onto target

targetDistance = 1000

for(i=0; i<1000; i+=50)
    {
    target = instance_nearest(phy_position_x + cos(degtorad(phy_rotation))*(i), phy_position_y + sin(degtorad(phy_rotation))*i, CharacterBody)
    testDistance = point_distance(target.x, target.y, x + cos(degtorad(phy_rotation))*i, y + + sin(degtorad(phy_rotation))*i)
    if testDistance < targetDistance and testDistance < 200 and target.myCharacter != thrower
        {
        targetDistance = testDistance
        targetPlayer = target
        }
    }

