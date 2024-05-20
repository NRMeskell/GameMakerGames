/// @description Sway

for(i=0; i<array_length_1d(branches); i++)
    branches[i].phy_rotation += swayAmount*sin(startOffset+sqrt(global.timeDiff)*current_time/1000)*0.2

