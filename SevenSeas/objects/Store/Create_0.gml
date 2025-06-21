/// @description Create Vars

allowManySelects = true

items = ds_list_create()

canTake = false
overflow = false
cargoAmounts = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

x = room_width*5/6
y = room_height/2

currentView = 0
maxView = 4
totalCost = 0

image_index = 0
image_speed = 0

storeName = "AVAILABLE ITEMS"
leftButtonText = "take"
rightButtonText = "close"

audio_play_sound(OpenMenuSnd, 1, false)

alarm[0] = 2


