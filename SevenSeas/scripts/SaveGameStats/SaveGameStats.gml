function SaveGameStats(argument0) {
	//update this game stats
	ini_open(argument0 + "\\gameStats.ini")

	ini_write_real("stats", "seas", GameStatsController.seasConquered)
	ini_write_real("stats", "gold", GameStatsController.goldCollected)
	ini_write_real("stats", "enemies", GameStatsController.enemiesDefeated)
	ini_write_real("stats", "locations", GameStatsController.locationsVisted)
	ini_write_real("stats", "stars", GameStatsController.totalCrewStars)

	ini_close()

	SaveGlobalGameStats()
}
