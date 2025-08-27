/// @description Fade in Border and Play music

alarm[0] = room_speed*2
    
with Pirate
    event_user(2)
with Cargo
    event_user(2)

instance_destroy(Event)
instance_destroy(StoreObjectParent)
instance_destroy(Store)
instance_destroy(MoraleDisplay)
ds_list_clear(global.notificationList)
ds_list_clear(ItemRunner.floatingItems)
global.doTime = false

///Controll music

for(i=0; i<ds_list_size(SoundController.seaMusic); i++){
    if audio_is_playing(ds_map_find_value(ds_list_find_value(SoundController.seaMusic, i), global.seaType))
        audio_sound_gain(ds_map_find_value(ds_list_find_value(SoundController.seaMusic, i), global.seaType), 0, 100)
    }  
    
if audio_is_playing(SoundController.combatMusic)
    audio_sound_gain(SoundController.combatMusic, 0, 100)
    
if audio_is_playing(ds_map_find_value(SoundController.portMusicMap, global.seaType))
    audio_sound_gain(ds_map_find_value(SoundController.portMusicMap, global.seaType), 0, 100)
    
audio_play_sound(DeathBellSnd, 1, false)

///vars

image_index = 0
image_speed = 1/6

drawX = room_width/2
drawY = room_height/2

