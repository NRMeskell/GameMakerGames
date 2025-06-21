/// @description Time Vars

eventTimeLeft = -1
eventTimeTotal = -1

instance_create(0, 0, SunLight)
instance_create(0, 0, MoonLight)

sunset = 0
global.isDay = true

global.timeCycleLength = room_speed*120
global.timeCycle = global.timeCycleLength/16

cloudLight = c_white
skyLight = make_color_rgb(120,140,255)
skyColor = merge_color(make_color_rgb(120,140,255), c_black, abs(sin(pi*((global.timeCycle)/(global.timeCycleLength))-pi/4)))

global.inPort = false
global.portType = 1
campingSpeed = 6

skyColor = merge_color(skyLight, c_black, abs(sin(pi*((global.timeCycle)/(global.timeCycleLength))-pi/4)))
cloudColor = merge_color(cloudLight, merge_color(c_white, c_black, 0.95), abs(sin(pi*((global.timeCycle)/(global.timeCycleLength))-pi/4))) 
 
waitEvent = undefined
waitCaller = undefined
waitSuccess = false

fullDay = (global.timeCycleLength/Clock.campingSpeed)