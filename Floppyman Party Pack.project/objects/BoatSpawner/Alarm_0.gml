/// @description Spawn Terrain

boat[0] = instance_create(x,y,BoatRight)
boat[1] = instance_create(x,y,BoatLeft)
boat[2] = instance_create(x,y,BoatTop)
boat[3] = instance_create(x,y,BoatFloor)
boat[4] = instance_create(x,y,BoatUpper)
boat[5] = instance_create(x,y,BoatWheel)


n = 5;
for(i=0; i<n; i++){
    boat[6+i] = instance_create(x+336, y+97, BoatSpoke)
    with boat[6+i]
        phy_rotation = other.i*(360/other.n)
}

