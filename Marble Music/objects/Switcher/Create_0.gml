/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();


vol = random_range(0.4, 0.7) / power(instance_number(Spring) + instance_number(Switcher), 0.4)
rotMax = 32
platRot = -rotMax
image_index = 0

myPlat = instance_create_depth(phy_position_x, phy_position_y, depth-1, SwitcherPlatform)
myPlat.phy_rotation = phy_rotation+platRot
myPlat.mySwitch = id