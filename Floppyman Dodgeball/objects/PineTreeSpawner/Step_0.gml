/// @description Sway

if !is_undefined(branches){
    branches[1].phy_position_x = x + swayAmount*sin(startOffset+sqrt(global.timeDiff)*current_time/1000)*3
    branches[2].phy_position_x = x + swayAmount*sin(startOffset+sqrt(global.timeDiff)*current_time/1000)*6
    branches[3].phy_position_x = x + swayAmount*sin(startOffset+sqrt(global.timeDiff)*current_time/1000)*9
}

