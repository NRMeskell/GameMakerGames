/// @description Set Volumes
ds_map_add(musicVolumeMap, oldChariotMap, 0.8)
ds_map_add(musicVolumeMap, leaveHerMap, 1)
ds_map_add(musicVolumeMap, drunkenSailorMap, 1)
ds_map_add(musicVolumeMap, wellermanMap, 0.8)
ds_map_add(musicVolumeMap, awayRioMap, 0.7)


for(i=0; i<ds_list_size(seaMusic); i++)
    {
    currentMap = ds_list_find_value(seaMusic, i)
    myVolume = ds_map_find_value(musicVolumeMap, currentMap)
    
    for (k = ds_map_find_first(currentMap); !is_undefined(k); k = ds_map_find_next(currentMap, k)) 
        audio_sound_gain(currentMap[? k], myVolume*musicVolumeBase*global.musicVolume*global.masterVolume, 0) 
    }

//combat music
for (k = ds_map_find_first(combatMusicMap); !is_undefined(k); k = ds_map_find_next(combatMusicMap, k)) 
    audio_sound_gain(combatMusicMap[? k], 1*musicVolumeBase*global.musicVolume*global.masterVolume, 0)
//port music
for (k = ds_map_find_first(portMusicMap); !is_undefined(k); k = ds_map_find_next(portMusicMap, k)) 
    audio_sound_gain(portMusicMap[? k], 0.7*musicVolumeBase*global.musicVolume*global.masterVolume, 0)
//camp music
for (k = ds_map_find_first(campMusicMap); !is_undefined(k); k = ds_map_find_next(campMusicMap, k)) 
    audio_sound_gain(campMusicMap[? k], 0.7*musicVolumeBase*global.musicVolume*global.masterVolume, 0)


//defeat music
audio_sound_gain(DefeatMusicSnd, 0.8*musicVolumeBase*global.musicVolume*global.masterVolume, 0)
    
//background sounds
audio_sound_gain(WavesSnd, 0.1*backgroundVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(SeagullsSnd, 0.7*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(CampFireSnd, 0.3*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(SeagullsPortSnd, 0.6*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(BeachWavesSnd, 0.5*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(JungleBackSnd, 0.7*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(ShipwreckSnd, 0.2*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(CaveWaterSnd, 0.2*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(HowlingWindSnd, 0.2*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(OasisSnd, 0.7*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(SeaLions, 0.4*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(DesertFlySnd, 0.3*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(CrowRiverSnd, 0.6*gameVolumeBase*global.worldVolume*global.masterVolume, 0)


//event Sounds
audio_sound_gain(CrashingRocksSnd, 1*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(EventSplashingSnd, 0.2*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(TurtleSnd, 0.7*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(MermaidsSnd, 0.7*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(StormSnd, 0.2*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(BugsBuzzingSnd, 1.2*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(ScratchingSnd, 0.5*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(SeaLionsAngrySnd, 0.15*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(HawkCrySnd, 0.3*gameVolumeBase*global.worldVolume*global.masterVolume, 0)



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
audio_sound_gain(SniperSnd, 0.8*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(ChaosSnd, 0.4*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(LookoutSnd, 0.5*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(BloodySnd, 0.4*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(TargetedSnd, 0.4*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(HealDeadSnd, 0.5*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(RaiseDeadSnd, 0.5*gameVolumeBase*global.worldVolume*global.masterVolume, 0)

audio_sound_gain(CannonSnd, 0.4*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(BroadsideSnd, 0.4*gameVolumeBase*global.worldVolume*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(ChainSnd, 0.4*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(ShrapnelSnd, 0.4*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(WarningSnd, 0.3*gameVolumeBase*global.worldVolume*global.masterVolume, 0)


//Camp Sounds
audio_sound_gain(ShipCreakSnd, 0.5*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(DiggingSnd, 0.5*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(BatSnd, 0.2*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(RopeSwingSnd, 0.2*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(RopeHookSnd, 0.6*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(JungleBirdSnd, 0.6*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(SplashSnd, 0.4*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(PaddleSnd, 0.5*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(SleepingSnd, 0.4*gameVolumeBase*global.worldVolume*global.masterVolume, 0)
audio_sound_gain(SearchingSnd, 0.2*gameVolumeBase*global.worldVolume*global.masterVolume, 0)


//menu sounds
audio_sound_gain(BellSnd, 0.3*menuVolumeBase*global.menuVolume*global.masterVolume, 0)
audio_sound_gain(OpenMenuSnd, 0.2*menuVolumeBase*global.menuVolume*global.masterVolume, 0)
audio_sound_gain(CloseMenuSound, 0.3*menuVolumeBase*global.menuVolume*global.masterVolume, 0)
audio_sound_gain(OpenMapSnd, 0.4*menuVolumeBase*global.menuVolume*global.masterVolume, 0)
audio_sound_gain(CloseMapSnd, 0.4*menuVolumeBase*global.menuVolume*global.masterVolume, 0)
audio_sound_gain(StoreSelectSnd, 0.3*menuVolumeBase*global.menuVolume*global.masterVolume, 0)
audio_sound_gain(SlidingOpenSnd, 0.3*menuVolumeBase*global.menuVolume*global.masterVolume, 0)
audio_sound_gain(SlidingClosedSnd, 0.08*menuVolumeBase*global.menuVolume*global.masterVolume, 0)
audio_sound_gain(StoreBuySnd, 0.1*menuVolumeBase*global.menuVolume*global.masterVolume, 0)
audio_sound_gain(DingSnd, 0.1*menuVolumeBase*global.menuVolume*global.masterVolume, 0)
