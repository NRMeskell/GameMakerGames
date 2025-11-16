/// @description Target Stuff
// You can write your code in this editor

targetSize = 16
targetTime = room_speed*10

	
myNote = instance_number(Target) mod array_length(SoundController.notes)
active = true
vol = random_range(0.5, 1) / power(instance_number(Target), 0.1)
