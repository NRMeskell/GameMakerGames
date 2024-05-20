/// @description Task and Level

if MyThing.Task = "Building"
    image_index = 1

if MyThing.Task = "Tree"
    image_index = 2
    
if MyThing.Task = "Rock"
    image_index = 3
    
Level = MyThing.Level

if Level = 1
    sprite_index = WorkerTagSpr
    
if Level = 1.5
    sprite_index = WorkerTag2
    
if Level = 2
    sprite_index = WorkerTag3

