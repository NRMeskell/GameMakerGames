/// @description Spawn Terrain

instance_create(x,y,FarmTopRoof)
instance_create(x,y,FarmLeftRoof)
instance_create(x,y,FarmRightRoof)
instance_create(x,y,FarmRailing)
instance_create(x+71,y+24,FarmTurbine)
with instance_create(x+71,y+24,FarmTurbine)
    phy_rotation = -90
with instance_create(x+71,y+24,FarmTurbine)
    phy_rotation = -180
with instance_create(x+71,y+24,FarmTurbine)
    phy_rotation = -270

