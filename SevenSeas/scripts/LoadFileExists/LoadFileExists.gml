// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function LoadFileExists(argument0){
	var files = ["BuildingFile.ini", "characters.ini", "MapDistanceFile.png", "MapGrid.ini", "MapIslandFile.png", "MapLandingFile.txt", "MapSeaVarsFile.txt", "pirate0.ini", "ship.ini"]
	for(var i=0; i<array_length(files); i++){
		if !file_exists(argument0 +  "\\" + files[i]){
			return false
		}
	}
	return true
}