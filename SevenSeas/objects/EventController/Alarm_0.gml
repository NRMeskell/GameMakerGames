/// @description Port Landing Event

desertPossible = false
with Pirate
    if morale < -1
        other.desertPossible = true

if desertPossible
    {
	checkPirate = instance_find(Pirate, irandom(instance_number(Pirate)-1))
    with checkPirate
        if morale <= irandom_range(-3, -2)
            {
            ds_list_add(global.notificationList, name + " deserted!", "Their morale be too low and they left our crew!")
            deserter = true
            event_user(2)
            }
    }
else
    {
    if irandom(2) > 0
        {
        myPortList = ds_map_find_value(specialPortEvents, global.seaType)
        if !is_undefined(myPortList)
            script_execute(ds_list_find_value(myPortList, irandom(ds_list_size(myPortList)-1)))
        }
    else
        {
        GetNewCharacterEncounter()
        }
    }

