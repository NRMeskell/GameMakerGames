/// @description Global sea types

global.seaNames[0] = "pirate cove"
global.seaNames[1] = "tropical islands"
global.seaNames[2] = "shipwreck shores"
global.seaNames[3] = "isles of the dead"
global.seaNames[4] = "volcanic islands"
global.seaNames[5] = "sea of monsters"
global.seaNames[6] = "royal waters"

///Audio Vars

musicVolumeBase = 0.8
gameVolumeBase = 1
menuVolumeBase = 0.9
backgroundVolumeBase = 0.3

oldChariotMap = ds_map_create()
oldChariotMap[? global.seaNames[0]] = OldChariotSnd
oldChariotMap[? global.seaNames[1]] = OldChariotTropicalSnd
oldChariotMap[? global.seaNames[2]] = OldChariotSnd
oldChariotMap[? global.seaNames[3]] = OldChariotSnd
oldChariotMap[? global.seaNames[4]] = OldChariotSnd
oldChariotMap[? global.seaNames[5]] = OldChariotSnd
oldChariotMap[? global.seaNames[6]] = OldChariotSnd

drunkenSailorMap = ds_map_create()
drunkenSailorMap[? global.seaNames[0]] = DrunkenSailorSnd
drunkenSailorMap[? global.seaNames[1]] = DrunkenSailorTropicalSnd
drunkenSailorMap[? global.seaNames[2]] = DrunkenSailorSnd
drunkenSailorMap[? global.seaNames[3]] = DrunkenSailorSnd
drunkenSailorMap[? global.seaNames[4]] = DrunkenSailorSnd
drunkenSailorMap[? global.seaNames[5]] = DrunkenSailorSnd
drunkenSailorMap[? global.seaNames[6]] = DrunkenSailorSnd

wellermanMap = ds_map_create()
wellermanMap[? global.seaNames[0]] = WellermanSnd
wellermanMap[? global.seaNames[1]] = WellermanTropicalSnd
wellermanMap[? global.seaNames[2]] = WellermanSnd
wellermanMap[? global.seaNames[3]] = WellermanSnd
wellermanMap[? global.seaNames[4]] = WellermanSnd
wellermanMap[? global.seaNames[5]] = WellermanSnd
wellermanMap[? global.seaNames[6]] = WellermanSnd

leaveHerMap = ds_map_create()
leaveHerMap[? global.seaNames[0]] = LeaveHerSnd
leaveHerMap[? global.seaNames[1]] = LeaveHerTropicalSnd
leaveHerMap[? global.seaNames[2]] = LeaveHerSnd
leaveHerMap[? global.seaNames[3]] = LeaveHerSnd
leaveHerMap[? global.seaNames[4]] = LeaveHerSnd
leaveHerMap[? global.seaNames[5]] = LeaveHerSnd
leaveHerMap[? global.seaNames[6]] = LeaveHerSnd

awayRioMap = ds_map_create()
awayRioMap[? global.seaNames[0]] = AwayRioSnd
awayRioMap[? global.seaNames[1]] = AwayRioTropicalSnd
awayRioMap[? global.seaNames[2]] = AwayRioSnd
awayRioMap[? global.seaNames[3]] = AwayRioSnd
awayRioMap[? global.seaNames[4]] = AwayRioSnd
awayRioMap[? global.seaNames[5]] = AwayRioSnd
awayRioMap[? global.seaNames[6]] = AwayRioSnd

portMusicMap = ds_map_create()
portMusicMap[? global.seaNames[0]] = PortMusicSnd
portMusicMap[? global.seaNames[1]] = PortMusicTropicalSnd
portMusicMap[? global.seaNames[2]] = PortMusicSnd
portMusicMap[? global.seaNames[3]] = PortMusicSnd
portMusicMap[? global.seaNames[4]] = PortMusicSnd
portMusicMap[? global.seaNames[5]] = PortMusicSnd
portMusicMap[? global.seaNames[6]] = PortMusicSnd

combatMusicMap = ds_map_create()
combatMusicMap[? global.seaNames[0]] = CombatMusicSnd
combatMusicMap[? global.seaNames[1]] = CombatMusicSnd
combatMusicMap[? global.seaNames[2]] = CombatMusicSnd
combatMusicMap[? global.seaNames[3]] = CombatMusicSnd
combatMusicMap[? global.seaNames[4]] = CombatMusicSnd
combatMusicMap[? global.seaNames[5]] = CombatMusicSnd
combatMusicMap[? global.seaNames[6]] = CombatMusicSnd

seaMusic = ds_list_create()
ds_list_add(seaMusic, awayRioMap, oldChariotMap, drunkenSailorMap, leaveHerMap, wellermanMap)

currentSong = audio_play_sound(PortMusicSnd, 0, false)
audio_stop_sound(currentSong)

musicVolumeMap = ds_map_create()
event_user(0)
audio_play_sound(WavesSnd, 1, true)

///Cursor
window_set_cursor(cr_none) 
cursor_sprite = MouseSpr;
