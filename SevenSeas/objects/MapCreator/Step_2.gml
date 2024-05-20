/// @description Sea conquering

//getSeaNumber
currentSeaNumber = -1
for(i=0; i<seaNumber; i++)
    if ds_map_find_value(seas[i], "type") = global.seaType
        currentSeaNumber = i

//open pannel
cs = sprite_get_width(ConquerSpr)/2
overConquer = !instance_exists(PirateLeveler) and !instance_exists(CombatRunner) and point_in_rectangle(mouse_x, mouse_y, conquerButtonX - cs, conquerButtonY - cs, conquerButtonX + cs, conquerButtonY + cs)

if overConquer and mouse_check_button_pressed(mb_left) 
    {
    if !instance_exists(DumpItem) and (global.doTime or global.inPort) and !instance_exists(Event)
        with instance_create(room_width/2, room_height/2, ConquerPannel){
            event_user(3)
        }
    else
        with ConquerPannel{
            event_user(3)
            event_user(1)
            }
    }
    
//check conquering
for(currentSea=0; currentSea<seaNumber; currentSea++){
    currentSeaType = ds_map_find_value(seas[currentSea], "type")
    
    //cove conquering
    if currentSeaType == global.seaNames[0]{
        stars = 0
        with Pirate
            {
            other.stars += stars
            }
        if stars > 3 and ds_map_find_value(seas[currentSea], "conquered") == false
            event_user(1)
        }
        
    //Tropical conquering
    else if currentSeaType == global.seaNames[1]  
        {
        ds_map_replace(condCritera, "lev1 0", "Collect pearls: " + string(winCond[1]) + "/10")
        if winCond[1] > 9 and ds_map_find_value(seas[currentSea], "conquered") == false
            event_user(1)
        }
}

///Release new seas



