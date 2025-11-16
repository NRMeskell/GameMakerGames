/// @description Create Cat Variables
// You can write your code in this editor

event_inherited()

mainAction = "Pet Moose"
name = "MOOSE"

// Move speed
stalkSpeed = 0.75/60*room_speed;
walkSpeed = 1/60*room_speed;
runSpeed = 4/60*room_speed;
spd = walkSpeed
prevPos = [x, y]

// Path-finding variables
catPath = ds_list_create()

// Game states
menaceTimer = 0
menace = false
chase = false
state = "sitting"
desire = "sit"

// Motivation to move
alarm[0] = irandom_range(room_speed*5, room_speed*20);

// Animation variables
image_xscale = 1
headMap = ds_map_create()
headMap[? MooseSittingSpr] = [21, 12]
headMap[? MooseWalkingSpr] = [32, 15]
headMap[? MooseRunningSpr] = [42, 17]
headMap[? MooseHeldSpr]    = [28, 15]

visible = true

// Create Graph of Platforms
platMap = ds_map_create()
catPath = ds_list_create()