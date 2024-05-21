function RaftPirateLetFloat() {
	
	with RaftEvent
	    floatAway = true

	with Pirate
	    UpdateMorale(-1, global.JOLLY)
    
    
	script_execute(closeEventCode)
}
