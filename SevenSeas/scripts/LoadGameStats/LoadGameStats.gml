function LoadGameStats(argument0) {
	stars = 0
	with Pirate{
	    other.stars += stars
	    }
    
	seas = 0
	for(i=0; i<7; i++)
	    if ds_map_find_value(MapCreator.seas[i], "conquered") == true
	        seas ++
        
	locations = 0
	for(i=0; i<instance_number(LandingSpot); i++)
	    if instance_find(LandingSpot, i).visited == true
	        locations ++

	ini_open(argument0 + "-gameStats.ini")

	GameStatsController.seasConquered = ini_write_real("stats", "seas", seas)
	GameStatsController.goldCollected = ini_write_real("stats", "gold", CargoAmount(0))
	GameStatsController.enemiesDefeated = ini_write_real("stats", "enemies", 0)
	GameStatsController.locationsVisted = ini_write_real("stats", "locations", locations)
	GameStatsController.totalCrewStars = ini_write_real("stats", "stars", stars)

	ini_close()




}
