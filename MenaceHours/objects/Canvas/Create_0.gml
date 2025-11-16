/// @description Target
// You can write your code in this editor

event_inherited()
hoveringOver = false

canDrop = true
pickedUp = false
pickable = true
actionable = true
image_speed = 0
image_index = 0 

state = "undrawn"
name = "Easel"
mainAction = "No Action"

readyForTask = false
myTask = global.DRAWING
taskDesc = "Put drawing on Easel"

x = choose(irandom_range(390, 500), irandom_range(560, 670), irandom_range(745, 780), irandom_range(1030, 1060))
