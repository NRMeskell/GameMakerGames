/// @description Major Save

if !instance_exists(Defeat){
	SaveMapVariables(gameName)
	SaveMapSurface(gameName)
	SaveLandingSpots(gameName)
	SaveBuildings(gameName)
	SaveShip(gameName)
	SaveCharacters(gameName)
	SavePirates(gameName)
}

saveGameTimer = 0


