/// @description Time Vars

instance_create(0, 0, SunLight)
instance_create(0, 0, MoonLight)

timeSpeed = 0.5
sunset = 0
global.isDay = true

global.timeCycleLength = room_speed*60
global.timeCycle = global.timeCycleLength/16
global.timeCycleRate = 1

cloudLight = c_white
skyLight = make_color_rgb(120,140,255)
skyColor = merge_color(make_color_rgb(120,140,255), c_black, abs(sin(pi*((global.timeCycle)/(global.timeCycleLength))-pi/4)))

global.inPort = false
global.portType = 1
campingSpeed = 6
campTime = (global.timeCycleLength div 4)/(timeSpeed*campingSpeed)

skyColor = merge_color(skyLight, c_black, abs(sin(pi*((global.timeCycle)/(global.timeCycleLength))-pi/4)))
cloudColor = merge_color(cloudLight, merge_color(c_white, c_black, 0.95), abs(sin(pi*((global.timeCycle)/(global.timeCycleLength))-pi/4))) 
        