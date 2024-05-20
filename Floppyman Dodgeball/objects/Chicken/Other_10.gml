/// @description Lock onto target

targetDistance = 1000

targetPlayer = instance_nearest(phy_position_x, phy_position_y, CharacterBody)
testDistance = point_distance(targetPlayer.x, targetPlayer.y, x, y)

if targetPlayer.x < x
    facing = -1
else
    facing = 1

