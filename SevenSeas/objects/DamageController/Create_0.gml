/// @description Action Damages

damageMin = ds_map_create()
damageMax = ds_map_create()
damageScaler = ds_map_create()

//Basic Melle
damageMin[? ShipSwordAttack] = 0.9
damageMax[? ShipSwordAttack] = 1.1
damageScaler[? ShipSwordAttack] = 10
//Heavy Melle
damageMin[? ShipHeavyBoardingAttack] = 0.75
damageMax[? ShipHeavyBoardingAttack] = 1.25
damageScaler[? ShipHeavyBoardingAttack] = 15
//Swarm Melle
damageMin[? ShipSwarmAttack] = 0.75
damageMax[? ShipSwarmAttack] = 1.5
damageScaler[? ShipSwarmAttack] = 6
//Hammer Melle
damageMin[? ShipHammerAttack] = 0.9
damageMax[? ShipHammerAttack] = 1.1
damageScaler[? ShipHammerAttack] = 3
//Scout Melle
damageMin[? ShipScoutAttack] = 0.8
damageMax[? ShipScoutAttack] = 1.1
damageScaler[? ShipScoutAttack] = 8
//Stab Melle
damageMin[? ShipFinishingAttack] = 0.75
damageMax[? ShipFinishingAttack] = 1.5
damageScaler[? ShipFinishingAttack] = 18
//Hold Fast Melle
damageMin[? ShipHoldFastAttack] = 0.8
damageMax[? ShipHoldFastAttack] = 1.2
damageScaler[? ShipHoldFastAttack] = 3
//Monkey Bit Attack
damageMin[? MonkeyBiteAttack] = 0.8
damageMax[? MonkeyBiteAttack] = 1.2
damageScaler[? MonkeyBiteAttack] = 6


//Basic Ranged
damageMin[? ShipGunAttack] = 0.8
damageMax[? ShipGunAttack] = 1.25
damageScaler[? ShipGunAttack] = 4
//Barrage Ranged
damageMin[? ShipBarrageAttack] = 0.75
damageMax[? ShipBarrageAttack] = 1.3
damageScaler[? ShipBarrageAttack] = 6
//Lookout Ranged
damageMin[? ShipLookoutAttack] = 0.8
damageMax[? ShipLookoutAttack] = 1.1
damageScaler[? ShipLookoutAttack] = 0
//Target Ranged
damageMin[? ShipTargetedAttack] = 0.75
damageMax[? ShipTargetedAttack] = 1.5
damageScaler[? ShipTargetedAttack] = 4
//Sniper Ranged
damageMin[? ShipSniperAttack] = 0.9
damageMax[? ShipSniperAttack] = 1.1
damageScaler[? ShipSniperAttack] = 3
//Chaos Ranged
damageMin[? ShipChaosAttack] = 0
damageMax[? ShipChaosAttack] = 0
damageScaler[? ShipChaosAttack] = 0
//bleed bullets
damageMin[? BleedingShotAttack] = 0.75
damageMax[? BleedingShotAttack] = 1.5
damageScaler[? BleedingShotAttack] = 5
//deafening squawk
damageMin[? ParrotSquawkAttack] = 0.8
damageMax[? ParrotSquawkAttack] = 1.2
damageScaler[? ParrotSquawkAttack] = 2


//Basic Cannon
damageMin[? ShipCannonAttack] = 0.8
damageMax[? ShipCannonAttack] = 1.1
damageScaler[? ShipCannonAttack] = 10
//Warning Cannon
damageMin[? ShipWarningAttack] = 0.8
damageMax[? ShipWarningAttack] = 1.1
damageScaler[? ShipWarningAttack] = 0
//Broadside Cannon
damageMin[? BroadsideAttack] = 0.75
damageMax[? BroadsideAttack] = 1.25
damageScaler[? BroadsideAttack] = 15
//Spray Cannon
damageMin[? SprayAttack] = 0
damageMax[? SprayAttack] = 2
damageScaler[? SprayAttack] = 12
//Chain Shot Cannon
damageMin[? ChainShotAttack] = 0.9
damageMax[? ChainShotAttack] = 1.2
damageScaler[? ChainShotAttack] = 10
//Shrapnel Shot Cannon
damageMin[? ShrapnelAttack] = 0.5
damageMax[? ShrapnelAttack] = 1.5
damageScaler[? ShrapnelAttack] = 3
//Concentrated Fire Cannon
damageMin[? ConcentratedFireAttack] = 0.8
damageMax[? ConcentratedFireAttack] = 1.2
damageScaler[? ConcentratedFireAttack] = 4
//Monkey Cannon
damageMin[? MonkeyCannonAttack] = 0.5
damageMax[? MonkeyCannonAttack] = 2
damageScaler[? MonkeyCannonAttack] = 5


//Ramming Ship
damageMin[? ShipRamming] = 0
damageMax[? ShipRamming] = 0
damageScaler[? ShipRamming] = 0
//outmaneuver
damageMin[? ShipOutmaneuver] = 0
damageMax[? ShipOutmaneuver] = 0
damageScaler[? ShipOutmaneuver] = 0
//shipChange
damageMin[? ShipShipChange] = 0
damageMax[? ShipShipChange] = 0
damageScaler[? ShipShipChange] = 0


