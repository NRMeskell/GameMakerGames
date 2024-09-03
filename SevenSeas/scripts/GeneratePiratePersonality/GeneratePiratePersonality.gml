function GeneratePiratePersonality() {
	myMainPer = irandom(3)
	mySecondPerAdjuster = choose(-1,1)
	mySecondPer = ((myMainPer + mySecondPerAdjuster) + 4) mod 4

	myGoal = choose("love", "money", "adventure", "action")
}
