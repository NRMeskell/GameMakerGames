/// @description Spin

phy_rotation -= FerrisWheelSpawner.spinSpeed*sqrt(global.timeDiff)

if phy_rotation < 0
    phy_rotation += 360
    
if phy_rotation > 360
    phy_rotation -= 360

