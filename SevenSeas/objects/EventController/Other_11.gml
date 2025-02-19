/*/// @description Rarity Map

//base rarity
if instance_number(Pirate) == global.shipMaxCrew[Ship.shipType]
    {
    eventRarity[? RaftPirate] = 0
    eventRarity[? Stowaway] = 0
    }
    
if !HasStored(4,1)
    eventRarity[? SpoiledFood] = 0

