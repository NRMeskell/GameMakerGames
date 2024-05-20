function SaveGlobalGameStats() {
	//update personal best stats
	ini_open("globalStats.ini")

	if ini_read_real("stats", "seas", 0) <= GameStatsController.seasConquered{
	    ini_write_real("stats", "seas", GameStatsController.seasConquered)
	    ini_write_string("name", "seas", SaveGameRunner.gameName)
	    }
    
	if ini_read_real("stats", "gold", 0) <= GameStatsController.seasConquered{
	    ini_write_real("stats", "gold", GameStatsController.seasConquered)
	    ini_write_string("name", "gold", SaveGameRunner.gameName)
	    }
    
	if ini_read_real("stats", "enemies", 0) <= GameStatsController.enemiesDefeated{
	    ini_write_real("stats", "enemies", GameStatsController.enemiesDefeated)
	    ini_write_string("name", "enemies", SaveGameRunner.gameName)
	    }
    
	if ini_read_real("stats", "locations", 0) <= GameStatsController.locationsVisted{
	    ini_write_real("stats", "locations", GameStatsController.locationsVisted)
	    ini_write_string("name", "locations", SaveGameRunner.gameName)
	    }
    
	if ini_read_real("stats", "stars", 0) <= GameStatsController.totalCrewStars{
	    ini_write_real("stats", "stars", GameStatsController.totalCrewStars)
	    ini_write_string("name", "locations", SaveGameRunner.gameName)
	    }
    
	ini_close()
}
