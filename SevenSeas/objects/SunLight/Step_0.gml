/// @description Move to sun

x = room_width/2 + 20 + dcos(Clock.image_angle + 180)*220
y = room_height/2 + 40 - dsin(Clock.image_angle + 180)*180
image_angle = point_direction(x, y, room_width/2, room_height*2)

myVolume = max(0, 5000*((room_height/2 + 80) - y)/138)


