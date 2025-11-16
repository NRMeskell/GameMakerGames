/// @description Set Up Game
// You can write your code in this editor
LootLockerTurnOnAutoRefresh()
LootLockerInitialize("dev_1fa6e23489cb45718acd53bd506d9278", "0.0.0.1", true, "31675");

userName = "Player" + string_replace(string_format(irandom(9999), 4, 0), " ", "0")
maxScore = 0
try{
	maxScoreStr = LLPlayerScore()
	maxScore = real(maxScoreStr)
	userName = LLPlayerName()
}catch(_exception){}

LootLockerSubmitScore("31675", maxScore);
LootLockerSetPlayerName(userName)

depth = 1

targetAdd = 100
basicMul = 0.05
switchMul = 0.08
springMul = 0.10

maxScoreStr = ""
currScoreStr = ""

topPlayers = []
topScores = []