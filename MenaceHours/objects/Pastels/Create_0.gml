/// @description Target
// You can write your code in this editor

event_inherited()
hoveringOver = false

canDrop = true
pickedUp = false
pickable = true
actionable = true
image_speed = 0
image_index = image_number-1

state = "undrawn"
name = "Pastels"
mainAction = "No Action"

readyForTask = false
myTask = global.DRAWING
taskDesc = "Put pastels on art shelf"

x = choose(irandom_range(390, 500), irandom_range(560, 670), irandom_range(745, 780), irandom_range(1030, 1060))
