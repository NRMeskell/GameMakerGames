with (other) {
///Move
x = Ship.drawX + placeX
y = GetWaterLevel(Ship.middleWaves, x)    

if x < -6000
    instance_destroy()
}
