/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

vol = random_range(0.5, 0.8) / power(instance_number(Spring) + instance_number(Switcher), 0.4)
exRate = 4
maxEx = 12
currEx = 0
desireEx = 0
image_index = 1

myPlat = instance_create_depth(phy_position_x, phy_position_y, depth-1, SpringPlatform)
myPlat.phy_rotation = phy_rotation
myPlat.mySwitch = id