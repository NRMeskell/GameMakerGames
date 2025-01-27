// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function GetNewMedicalEvent(){
	var crewMaxHealth = 0
	var crewCurHealth = 0
	for(var i=0; i<instance_number(Pirate); i++){
		crewMaxHealth += instance_find(Pirate, i).maxHealth
		crewCurHealth += instance_find(Pirate, i).myHealth
	}
	
	var medEvent
	if crewCurHealth <= crewMaxHealth/2 or irandom(2){
		medEvent = choose(Surgery, RestfulWaters)
	}
	else{
		if round(global.foodQuality) <= 1
			medEvent = choose(SailingAccident, Scurvy)
		else
			medEvent = SailingAccident
	}
	
	script_execute(medEvent)
}