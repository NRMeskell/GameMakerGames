/// @description Major Save

if !instance_exists(Defeat){
	SaveMapVariables(gameName)
	SaveMapSurface(gameName)
	SaveLandingSpots(gameName)
	SaveBuildings(gameName)
	SaveShip(gameName)
	SaveCharacters(gameName)
	//SaveGameStats(gameName)
	SavePirates(gameName)
}

saveGameTimer = 0


