/// @description Create Clouds and start alarm

alarm[0] = 1

for(i=0; i<2+2*(room=BlimpGameRoom or global.gameMode == "golf"); i++){
    instance_create(irandom(room_width/2) + room_width/(2+2*(room=BlimpGameRoom))*i, random_range(room_height*0.15, room_height*(0.5+0.25*(room=BlimpGameRoom))), Cloud)   
}

