/// @description Starting Pirates and Cargo

with ChoosePirateParent
    {
    event_user(0) 
    instance_destroy()
    }
    
with CreatePirate(true)
    {
    event_user(0)
    }
    
with Pirate
    event_user(4)

StoreCargo(0,20)
StoreCargo(6,10)
StoreCargo(2,10)

GameStatsController.goldCollected = 0


