/// @description Minor Save

if !instance_exists(Defeat){
	SaveMapVariables(gameName)
	SaveLandingSpots(gameName)
	SaveBuildings(gameName)
	SaveShip(gameName)
	SavePirates(gameName)
	SaveCharacters(gameName)
	SaveReputation(gameName)
}
saveGameTimer = 0

