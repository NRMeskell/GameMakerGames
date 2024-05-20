/// @description Move Left

phy_position_x += 1*sqrt(global.timeDiff)

if phy_position_x > FactorySpawner.x + 840
    {
    phy_position_x = FactorySpawner.x + 600
    }

