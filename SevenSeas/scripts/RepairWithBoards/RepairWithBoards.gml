
function RepairWithBoards(){
	var boards = PlanksNeededForRepairs();
	UpdateHealth(Ship, boards*(Ship.maxHealth div 10));
	LoseCargo(3, boards);
	return boards;
}

function PlanksNeededForRepairs(){
	var boards = 0
	var available = CargoAmount(3)
		
	var repaired = 0
	//Repair damages
	while boards < available and (Ship.myHealth + repaired < Ship.maxHealth)
	    {
		boards += 1
	    repaired += Ship.maxHealth div 10
	    }
	return boards
}