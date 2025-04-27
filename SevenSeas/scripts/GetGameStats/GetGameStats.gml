// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function GetGameStats(argument0){
	try{
		var conqueredSeas = 0
		var writeFile = file_text_open_read(argument0 + "\\MapSeaVarsFile.txt");
		for(var n=0; n<7; n++){
		    var currentLine = file_text_readln(writeFile)
		    var currentData = SplitLine(currentLine, ",")
		    conqueredSeas += currentData[3]
		    }
	
		var pirateNumber = 0
		for(var p=0; p<6; p++){
		    if file_exists(argument0 + "\\pirate" + string(p) + ".ini")
		        pirateNumber ++ 
		}
	
		var shipName = ""
		if file_exists(argument0 + "\\ship.ini"){
			ini_open(argument0 + "\\ship.ini")
			shipName = global.shipName[ini_read_real("vars", "type", 0)]
		}
		return [conqueredSeas, pirateNumber, shipName]
	}
	catch(_exception){
		return ["-", "-", "unknown"]
	}
}