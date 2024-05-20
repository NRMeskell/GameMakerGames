/// @description Move to moon

x = room_width/2 + 20 + dcos(Clock.image_angle)*220
y = room_height/2 + 40 - dsin(Clock.image_angle)*180
image_angle = point_direction(x, y, room_width/2, room_height*2)

myVolume = max(0, moonPowers[image_index] * 1000*((room_height/2 + 80) - y)/138)

