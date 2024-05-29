/// @description Event codes

eventTimeAmount = room_speed*5
eventTimer = random_range(1,2)*eventTimeAmount
global.healTimer = room_speed

//Normal Events
stillEventList = ds_list_create()
normalEventList = ds_list_create()
roughEventList = ds_list_create()

eventList[0] = ds_list_create()
eventList[1] = ds_list_create()
eventList[2] = ds_list_create()
eventList[3] = ds_list_create()
eventList[4] = ds_list_create()
eventList[5] = ds_list_create()
eventList[6] = ds_list_create()

ds_list_add(stillEventList, RottenPlanks, CrazyPirateMaker, SpoiledFood, SpoiledFood)
ds_list_add(normalEventList, Shortcut, SpoiledFood, RottenPlanks, BirdsArrive, PlagueShip, MerchantArrive, RaftPirate, DolphinsArrive, FloatingBarrel, FloatingBarrel)
ds_list_add(roughEventList, SeaSickPirates, ManOverboard, SeaSickPirates, MastDamaged)

ds_list_add(eventList[0], SupplyBoxArrive, RaftPirate, PirateShipArrive, FloatingBarrel, FloatingBarrel, PirateShipArrive, TradingPostArrive, PirateShipArrive, TradingPostArrive)
ds_list_add(eventList[1], MermaidRocks, TropicalFishArrive, BugsAttack, StrangeAnimal, TropicalHeat, FrogsArrive, BirdsArrive, DolphinsArrive, SpoiledFood, PirateShipArrive, RottenPlanks, RaftPirate, Stowaway)
ds_list_add(eventList[2], FloatingBarrel, RaftPirate, PirateShipArrive, FloatingBarrel, )
ds_list_add(eventList[3], DolphinsArrive)
ds_list_add(eventList[4], DolphinsArrive)
ds_list_add(eventList[5], DolphinsArrive)
ds_list_add(eventList[6], DolphinsArrive)

specialEventMap = ds_map_create()
for(i=0; i<7; i++)
    ds_map_add(specialEventMap, global.seaNames[i], eventList[i])


///Landing Events

//Create lists
//eventListPortNormal = ds_list_create()

eventListPort[0] = ds_list_create()
eventListPort[1] = ds_list_create()
eventListPort[2] = ds_list_create()
eventListPort[3] = ds_list_create()
eventListPort[4] = ds_list_create()
eventListPort[5] = ds_list_create()
eventListPort[6] = ds_list_create()

//Add to lists
//ds_list_add(eventListPortNormal, CargoStolen, RefreshmentStand, PortFight)

ds_list_add(eventListPort[0], FoundItems, PortFight, RefreshmentStand, Entertainers)
ds_list_add(eventListPort[1], CargoStolen, HostileLocals, WildAnimals, FruitBaskets, RefreshmentStand)
ds_list_add(eventListPort[2], TeasingLocals, CargoStolen, PortFight, PoorLanding, Entertainers)
ds_list_add(eventListPort[3], CargoStolen)
ds_list_add(eventListPort[4], PoorLanding)
ds_list_add(eventListPort[5], CargoStolen)
ds_list_add(eventListPort[6], Entertainers, HostileLocals)


//Group lists

specialPortEvents = ds_map_create()
for(i=0; i<7; i++)
    {
    ds_map_add(specialPortEvents, global.seaNames[0], eventListPort[i])
    }

///Enemy Lists

enemySeenList[0] = PirateShipArrive
enemySeenList[1] = FrogsArrive
enemySeenList[2] = PirateShipArrive
enemySeenList[3] = PirateShipArrive
enemySeenList[4] = PirateShipArrive
enemySeenList[5] = PirateShipArrive
enemySeenList[6] = PirateShipArrive

enemyList[0] = ds_list_create()
enemyList[1] = ds_list_create()
enemyList[2] = ds_list_create()
enemyList[3] = ds_list_create()
enemyList[4] = ds_list_create()
enemyList[5] = ds_list_create()
enemyList[6] = ds_list_create()

ds_list_add(enemyList[0], EnemyShip)
ds_list_add(enemyList[1], EnemyShip, TropicalEnemy, TropicalEnemySword)
ds_list_add(enemyList[2], EnemyShip)
ds_list_add(enemyList[3], EnemyShip)
ds_list_add(enemyList[4], EnemyShip)
ds_list_add(enemyList[5], EnemyShip)
ds_list_add(enemyList[6], EnemyShip)

enemyMap = ds_map_create()
enemySeenMap = ds_map_create()
for(i=0; i<7; i++)
    {
    ds_map_add(enemyMap, global.seaNames[i], enemyList[i])
    ds_map_add(enemySeenMap, global.seaNames[i], enemySeenList[i])
    }


///Activate Event Diff
global.seaLevel = 0
event_user(0)

///Event Rarity Creator

/*eventRarity = ds_map_create()
event_user(1)*/


///Request lists
requestLists[0] = [BreakRequest, PartyCrew, InstrumentLearn, NewShifts, ShantyRequest]
requestLists[1] = [Checkers, MessyPirate, LessNoise, StarsMapping, ImproveShip, CookLearn]
requestLists[2] = [BugSquash, FlagDesign, StolenJournal, KnifeKitchen, HardenedTraining, NewWeaponRequest]
requestLists[3] = [RaceUpMast, SpearFishing, BackflipRequest, KnifeRequest, RunAround]


//Reputation
global.reputation = ds_list_create()
reputationTypes = ds_list_create()