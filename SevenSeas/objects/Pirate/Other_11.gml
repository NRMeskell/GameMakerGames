/// @description Select

if !instance_exists(Defeat){
    if selected = false
        {
        audio_play_sound(OpenMenuSnd, 1, false)
        
        with Pirate
            event_user(0)
        with Cargo
            event_user(0)
        selected = true
        }
    else
        event_user(0)
}
else
    event_user(0)

