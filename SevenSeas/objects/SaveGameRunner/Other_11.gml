/// @description Minor Save

if !instance_exists(Defeat){
	SaveMapVariables(gameName)
	SaveLandingSpots(gameName)
	SaveBuildings(gameName)
	SaveShip(gameName)
	SavePirates(gameName)
	SaveCharacters(gameName)
}
saveGameTimer = 0

