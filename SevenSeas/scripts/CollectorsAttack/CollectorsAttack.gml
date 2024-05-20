function CollectorsAttack() {
	//intimidate

	instance_create(0,0,EnemyCollectors)
	instance_destroy(EventDrawer)
	with CoveCollector    
	    UpdateCharacterEvents(PirateCollectorsCaught)

	
	script_execute(closeEventCode, 2)



}
