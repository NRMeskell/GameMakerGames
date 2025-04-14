/// @description update Stats

name = "ramming"
if instance_exists(Ship)
	description = "change to close combat zone. deal 1/4 of your ship's current health (" + string(round(Ship.myHealth/6)) + ") to enemy ship. End Combat Round."
else
	description = "change to close combat zone. deal 1/4 of your ship's current health to enemy ship. End Combat round."


