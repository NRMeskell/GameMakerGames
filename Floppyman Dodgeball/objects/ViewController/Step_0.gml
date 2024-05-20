/// @description Move to players

myX = 0;
myY = 0

for(i=0; i<instance_number(CharacterController); i++){
    currentBody = instance_find(CharacterController, i).body
    myX += currentBody.x
    myY += currentBody.y
    }
    
myX = myX/instance_number(CharacterController)
myY = myY/instance_number(CharacterController)

desiredX = (room_width/2 + dcos(point_direction(room_width/2, room_height/2, myX, myY))*point_distance(room_width/2, room_height/2, myX, myY)/(20 + 0*(global.gameMode=="dodgeball")))
desiredY = (room_height/2 - dsin(point_direction(room_width/2, room_height/2, myX, myY))*point_distance(room_width/2, room_height/2, myX, myY)/(20 + 0*(global.gameMode=="dodgeball")))

if abs(x - desiredX) > 0.1
    x += (desiredX - x)/20
if abs(y - desiredY) > 0.1
    y += (desiredY - y)/20

///Change view

//make screen correct size
if __view_get( e__VW.HPort, 0 ) != display_get_gui_height(){
    __view_set( e__VW.HPort, 0, display_get_gui_height( ))
    __view_set( e__VW.WPort, 0, __view_get( e__VW.HPort, 0 )*960/540 )
    }

//move view
if !CharacterCreator.inMenu
    {
    viewWidth = min(x, room_width-x)*2
    viewHeight = min(y, room_height-y)*2
    viewScale = min(viewWidth, viewHeight*960/540)
    
    __view_set( e__VW.WView, 0, viewScale )
    __view_set( e__VW.HView, 0, viewScale*540/960 )
    
    __view_set( e__VW.XView, 0, x-__view_get( e__VW.WView, 0 )/2 )
    __view_set( e__VW.YView, 0, y-__view_get( e__VW.HView, 0 )/2 )
    }
else
    {
    __view_set( e__VW.HView, 0, 540 )
    __view_set( e__VW.WView, 0, 960 )
    __view_set( e__VW.XView, 0, 0 )
    __view_set( e__VW.YView, 0, 0 )
    }

