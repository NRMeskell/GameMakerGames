/// @description Spawn Terrain

instance_create(x,y,FactoryRoof)
instance_create(x,y,FactoryLower)
instance_create(x,y,FactoryLowerBelt)
//instance_create(x,y,FactoryPipe)

instance_create(x+131, y+80, FactoryWheel)
instance_create(x+131, y+414, FactoryWheel)

cartNumber = 4
for(i=0; i < cartNumber; i++)
    {
    with instance_create(0,0,FactoryPoint)
        {
        myStartPos = other.i/other.cartNumber
        alarm[0] = 1
        }
    }
    
beltNumber = 10
for(i=0; i<beltNumber; i++)
    {
    instance_create(x+600 + i*(840-600)/beltNumber, y+256, FactoryBelt)
    }

