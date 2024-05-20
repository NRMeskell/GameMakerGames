/// @description Move to good location

startingY = y
       
distance = 1
placeFound = false
while place_meeting(x, y, Ground) and !placeFound {    
    for(i=0; i<360; i+= 1){
        if !place_meeting(x + dcos(i)*distance, y + dsin(i)*distance, Ground) and !collision_line(x + dcos(i)*distance/2,y+ dsin(i)*distance/2,x + dcos(i)*distance, y + dsin(i)*distance, Ground, true, true) {
            x = x + dcos(i)*distance
            y = y + dsin(i)*distance
            placeFound = true
			break
        }       
    }
	distance += 3
}

while !collision_line(x,y,x,y+1,Ground,true,true){
    y ++
    if y > room_height{
		x += choose(-3, 3)
        y = startingY - 20 
        event_user(0)
        break
        }
    }

