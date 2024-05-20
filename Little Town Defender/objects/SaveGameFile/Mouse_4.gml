/// @description Save

room = GameMap1

global.SaveVol = true

game_save(LoadFile)

global.SaveVol = false

MySound = audio_play_sound(DingSnd, 1, false)

room = Pause


