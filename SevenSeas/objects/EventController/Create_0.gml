/// @description Event codes


global.eventOpen = false
eventTimeAmount = room_speed*2.5
eventTimer = ((random_range(1,2)*eventTimeAmount)/global.gameRate) div 1
//global.healTimer = room_speed

//Normal Events
stillEventList = ds_list_create()
//normalEventList = ds_list_create()
roughEventList = ds_list_create()

eventList[0] = ds_list_create()
eventList[1] = ds_list_create()
eventList[2] = ds_list_create()
eventList[3] = ds_list_create()
eventList[4] = ds_list_create()
eventList[5] = ds_list_create()
eventList[6] = ds_list_create()

ds_list_add(stillEventList, RottenPlanks, CrazyPirateMaker, SpoiledFood, RestfulWaters, SwitchWeather)
ds_list_add(roughEventList, SeaSickPirates, ManOverboard, SeaSickPirates, MastDamaged, SwitchWeather)
//NORMAL EVENT LIST PHASED OUT!!!


ds_list_add(eventList[0], Shortcut, BirdsArrive, Stowaway, SupplyBoxArrive, RaftPirate, FloatingBarrel, TradingPostArrive, PirateShipArrive, PlagueShip, MerchantArrive)
ds_list_add(eventList[1], MermaidRocks, TropicalFishArrive, BugsAttack, StrangeAnimal, FrogsArrive, BirdsArrive, DolphinsArrive, SpoiledFood, RottenPlanks, MerchantArrive)
ds_list_add(eventList[2], Shortcut, FloatingBarrel, RaftPirate, PirateShipArrive, ScavengersArrive, DamagedShip, ThickFogArrive, RuinsArrive, FloatingDebris, MerchantArrive)
ds_list_add(eventList[3], ThickFogArrive, FloatingLights, BlackSpotArrives, FloatingBarrel, HowlingWinds, SkelRaftPirate, SpoiledFood, SkeletonsArrive, PlagueShip, BugsAttack)
ds_list_add(eventList[4], Shortcut, DolphinsArrive, IntenseHeat, BoilingWater, BirdsArrive, MiningRockArrive, SmokeyWater, SharpRock, RottenPlanks, SwitchWeather, LavaShipArrive)
ds_list_add(eventList[5], StrangeAnimal, MermaidRocks, FloatingBarrel, DamagedShip, SerpentBlock)
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

ds_list_add(eventListPort[0], FoundItems, RefreshmentStand, Entertainers)
ds_list_add(eventListPort[1], HostileLocals, FruitBaskets, RefreshmentStand)
ds_list_add(eventListPort[2], CargoStolen, PortFight, PoorLanding)
ds_list_add(eventListPort[3], ScaryLocals, SkeletalArmArrives, SkeletonDrink)
ds_list_add(eventListPort[4], noone)
ds_list_add(eventListPort[5], WildAnimals)
ds_list_add(eventListPort[6], noone)


//Group lists

specialPortEvents = ds_map_create()
for(i=0; i<7; i++)
    {
    ds_map_add(specialPortEvents, global.seaNames[0], eventListPort[i])
    }

///Enemy Lists

enemySeenList[0] = PirateShipArrive
enemySeenList[1] = FrogsArrive
enemySeenList[2] = ScavengersArrive
enemySeenList[3] = SkeletonsArrive
enemySeenList[4] = noone
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
ds_list_add(enemyList[1], TropicalEnemy)
ds_list_add(enemyList[2], ScavengerShip)
ds_list_add(enemyList[3], SkeletonShip)
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
// (Morale, cargo/item, health, custom, custom)
// Jolly
requestLists[0] = [ShantyRequest, GoSwimming, DrinkRum, InstrumentLearn, NewShifts]
// Keen: Raise or lower only my morale
requestLists[1] = [Checkers, ExpandCargo, FlagDesign, StarsMapping, StolenJournal]
// Fearsome: Raise my morale (at risk of others)
requestLists[2] = [BugSquash, MessyPirate, KnifeRequest, LessNoise, RunAround]
// Raise my morale (at risk of health/cargo)
requestLists[3] = [SkippingAbout, SpearFishing, BackflipRequest, CargoJuggle, RaceUpMast]


//Reputation
global.reputation = ds_list_create()
reputationTypes = ds_list_create()