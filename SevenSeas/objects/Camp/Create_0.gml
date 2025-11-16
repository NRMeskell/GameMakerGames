/// @description vars
myLight[0] = noone
myLightY[0] = -10
myLightX[0] = 0

buttonNumber = 3
event_user(0)
myName = "camp"
campPower = 1

button[0] = "rest and repair"
button[1] = "search for supplies"
button[2] = "undefined"

//Place vars

//names
buttonNames[0] = "explore the cave"
buttonNames[1] = ""
buttonNames[2] = "scale the cliffs"
buttonNames[3] = "dig for treasure"
buttonNames[4] = "explore the jungle"
buttonNames[5] = "dive in the oasis"
buttonNames[6] = "loot the wreckage"
buttonNames[7] = "hunt among the rocks"
buttonNames[8] = "wander into desert"
buttonNames[9] = "raft up the river"
buttonNames[10] = "flip over lava rocks"
buttonNames[11] = "approach the tikis"


myFire = audio_play_sound(CampFireSnd, 0, true)
audio_stop_sound(myFire)
//resting vars
getTreasure = undefined

sprite_index = CampFireSpr

