/// @description Select

if selected = false and !global.itemSelected
    {
    with Pirate
        event_user(0)
    with Cargo
        event_user(0)
    selected = true
    }
else
    event_user(0)

