/// @description Scrolling

if overButton and MapCreator.mapClose = true and !instance_exists(Defeat) and sprite_index != CampFireDeadSpr
    {
    if currentHeight < sprite_get_height(LandMenuSpr)
        {
        currentHeight += scrollSpeed
        if audio_is_paused(myOpenSound)
            {
            audio_sound_set_track_position(myOpenSound, 0.2)
            audio_resume_sound(myOpenSound)
            }
        }
    if currentHeight > sprite_get_height(LandMenuSpr)
        {
        currentHeight = sprite_get_height(LandMenuSpr)
        audio_pause_sound(myOpenSound)
        }
    }
else
    {
    audio_pause_sound(myOpenSound)
    if currentHeight > 0
        {
        currentHeight -= scrollSpeed
        }
    if currentHeight < 0
        {
        currentHeight = 0
        }
    }

