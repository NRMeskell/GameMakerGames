/// @description Create Vars
// You can write your code in this editor
taskState = ds_map_create()
// Task List
global.GROCERIES = "Put Away the Groceries"
ds_map_add(taskState, global.GROCERIES, "waiting")
global.DISHES = "Do the Dishes"
ds_map_add(taskState, global.DISHES, "waiting")
global.LAUNDRY = "Fold the Laundry"
ds_map_add(taskState, global.LAUNDRY, "missing")
global.SCOOP = "Scoop the Litter Box"
ds_map_add(taskState, global.SCOOP, "missing")
global.DRESS = "Choose an Outfit"
ds_map_add(taskState, global.DRESS, "missing")
global.BRUSH = "Brush Your Teeth"
ds_map_add(taskState, global.BRUSH, "missing")
global.FEED = "Fill Moose's Dish"
ds_map_add(taskState, global.FEED, "missing")
global.BREAKFAST = "Make Breakfast"
ds_map_add(taskState, global.BREAKFAST, "missing")
global.LUNCH = "Pack a Lunch"
ds_map_add(taskState, global.LUNCH, "missing")
global.TEA = "Brew a Cup of Tea"
ds_map_add(taskState, global.TEA, "missing")
global.VACUUM = "Vacuum the Rug"
ds_map_add(taskState, global.VACUUM, "missing")
global.DRAWING = "Draw a picture"
ds_map_add(taskState, global.DRAWING, "waiting")
global.BLANKET = "Set up the couch"
ds_map_add(taskState, global.BLANKET, "waiting")

tasksOpen = false

currMiniGame = noone