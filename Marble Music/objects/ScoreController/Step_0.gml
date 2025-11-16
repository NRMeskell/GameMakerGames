/// @description Run Game
// You can write your code in this editor

// Calculate Score

if room == GameRoom{
	var win = true
	var currScore = 0, targets=0;
	for(var i=0; i<instance_number(Target); i++){
		with instance_find(Target, i){
			if alarm[0] < 1
				win = false
			else{
				targets ++
				currScore += other.targetAdd
			}
		}
	}


	GameController.win = win;

	var basics = instance_number(BasicPlatform),
	    springs = instance_number(Spring),
		switches = instance_number(Switcher);

	currScoreStr = "Targets: " + string(currScore)
	currScoreStr = currScoreStr + "\nPlatforms: -" + string(ceil(100-power(1-basicMul,basics)*100)) + "%"
	currScoreStr = currScoreStr + "\nSwitchers: -" + string(ceil(100-power(1-switchMul, switches)*100)) + "%"
	currScoreStr = currScoreStr + "\nSprings: -" + string(ceil(100-power(1-springMul, springs)*100)) + "%"

	currScore = floor(currScore*power(1-basicMul,basics)*power(1-switchMul, switches)*power(1-springMul, springs))
	currScoreStr = currScoreStr + "\n---------------"
	currScoreStr = currScoreStr + "\nScore: " + string(currScore)

	if currScore > maxScore{
		maxScore = currScore
		LootLockerSubmitScore("31675", maxScore);
	}
	currScoreStr = currScoreStr + "\n---------------"
	currScoreStr = currScoreStr + "\nBest: " + string(maxScore)
}else{
	topPlayers = LLHighscoresTopNamesList()
	topScores = LLHighscoresTopScoreList()

	currScoreStr = "Leaderboard:"
	currScoreStr = currScoreStr + "\n---------------"
	for(i=0; i<10; i++){
		if topScores[i] != " "{
			currScoreStr = currScoreStr + "\n" + string(i+1) + ". "
			currScoreStr = currScoreStr + string(topPlayers[i])
			currScoreStr = currScoreStr + string(string_repeat(" ", 14 - string_length(topPlayers[i])))
			currScoreStr = currScoreStr + string(topScores[i])
			}
		else{ currScoreStr = currScoreStr + "\n" }
	}
	currScoreStr = currScoreStr + "\n---------------"
	currScoreStr = currScoreStr + "\n" + LLPlayerRank() + ". "
	currScoreStr = currScoreStr + userName
	currScoreStr = currScoreStr + string(string_repeat(" ", 14 - string_length(userName)))
	currScoreStr = currScoreStr + string(maxScore)
}