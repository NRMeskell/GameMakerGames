/// @description Move and dissappear
// You can write your code in this editor

///Move
x = Ship.drawX + placeX
y = room_height - Ship.middleWaves.waveBase - 20

if x < -6000
    instance_destroy()

