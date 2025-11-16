function find_minigame(name){
	with MiniGameRunner if gameName == name{
		return id;
	}
	return noone;
}

function start_minigame(miniGame){
	with miniGame{
		TaskController.currMiniGame = id;
		TaskController.tasksOpen = false;
		event_user(1)
		return;
	}
}

function end_minigame(){
	if completeness >= 100{
		TaskController.taskState[? gameName] = "complete"
		event_user(2)
		
	}
	TaskController.currMiniGame = noone
}

