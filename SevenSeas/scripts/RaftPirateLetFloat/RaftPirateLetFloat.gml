function RaftPirateLetFloat() {
	
	AddReputation("repute", -1, "adrift sailor refusal")
	
	with RaftEvent
	    floatAway = true

	with Pirate
	    UpdateMorale(-1, global.JOLLY)
    
    
	script_execute(closeEventCode)
}
