/// @description Set Volumes
ds_map_add(musicVolumeMap, oldChariotMap, 0.5)
ds_map_add(musicVolumeMap, leaveHerMap, 0.6)
ds_map_add(musicVolumeMap, drunkenSailorMap, 0.5)
ds_map_add(musicVolumeMap, wellermanMap, 0.3)
ds_map_add(musicVolumeMap, awayRioMap, 0.5)


for(i=0; i<ds_list_size(seaMusic); i++)
    {
    currentMap = ds_list_find_value(seaMusic, i)
    myVolume = ds_map_find_value(musicVolumeMap, currentMap)
    
    for (k = ds_map_find_first(currentMap); !is_undefined(k); k = ds_map_find_next(currentMap, k)) 
        audio_sound_gain(currentMap[? k], myVolume*musicVolumeBase*global.musicVolume*global.masterVolume, 0) 
    }

//combat music
for (k = ds_map_find_first(combatMusicMap); !is_undefined(k); k = ds_map_find_next(combatMusicMap, k)) 
    audio_sound_gain(combatMusicMap[? k], 0.4*musicVolumeBase*global.musicVolume*global.masterVolume, 0)
//port music
for (k = ds_map_find_first(portMusicMap); !is_undefined(k); k = ds_map_find_next(portMusicMap, k)) 
    audio_sound_gain(portMusicMap[? k], 0.2*musicVolumeBase*global.musicVolume*global.masterVolume, 0)
//combat music
for (k = ds_map_find_first(combatMusicMap); !is_undefined(k); k = ds_map_find_next(combatMusicMap, k)) 
    audio_sound_gain(combatMusicMap[? k], 0.4*musicVolumeBase*global.musicVolume*global.masterVolume, 0)
//defeat music
audio_sound_gain(DefeatMusicSnd, 0.6*musicVolumeBase*global.musicVolume*global.masterVolume, 0)
    
//background sounds
audio_sound_gain(WavesSnd, 0.1*backgroundVolumeBase*global.worldVolume*global.masterVolume, 0)

//game sounds
audio_sound_gain(SwordSnd, 0.5*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(SwarmSnd, 0.5*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(HeavySwordSnd, 0.4*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(ShieldsSnd, 0.3*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(HammerSnd, 0.4*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(BloodySwordSnd, 0.4*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(ScoutingSnd, 0.6*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(DeathBellSnd, 0.6*gameVolumeBase*global.worldVolume*global.masterVolume, 0)

audio_sound_gain(GunShotSnd, 0.4*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(BarrageSnd, 0.4*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(SniperSnd, 0.4*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(ChaosSnd, 0.4*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(LookoutSnd, 0.5*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(BloodySnd, 0.4*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(TargetedSnd, 0.4*gameVolumeBase*global.worldVolume*global.masterVolume, 0)

audio_sound_gain(CannonSnd, 0.4*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(BroadsideSnd, 0.4*gameVolumeBase*global.worldVolume*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(ChainSnd, 0.4*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(ShrapnelSnd, 0.4*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(WarningSnd, 0.3*gameVolumeBase*global.worldVolume*global.masterVolume, 0)


audio_sound_gain(ShipCreakSnd, 0.5*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(DiggingSnd, 0.5*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(BatSnd, 0.2*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(RopeSwingSnd, 0.2*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(RopeHookSnd, 0.6*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(JungleBirdSnd, 0.2*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(SplashSnd, 0.3*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(PaddleSnd, 0.5*gameVolumeBase*global.worldVolume*global.masterVolume, 0)

//menu sounds
audio_sound_gain(BellSnd, 0.4*menuVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(OpenMenuSnd, 0.2*menuVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(CloseMenuSound, 0.3*menuVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(OpenMapSnd, 0.4*menuVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(CloseMapSnd, 0.4*menuVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(StoreSelectSnd, 0.3*menuVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(SlidingOpenSnd, 0.3*menuVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(SlidingClosedSnd, 0.08*menuVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(StoreBuySnd, 0.1*menuVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(DingSnd, 0.1*menuVolumeBase*global.worldVolume*global.masterVolume, 0)

