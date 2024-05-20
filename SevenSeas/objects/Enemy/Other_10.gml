/// @description Vars

xGap = sprite_width + 5
startX = room_width
startY = sprite_height*2.2 
drawHeight = 0
drawTop = sprite_get_height(EnemyDropDownSpr) 

x = startX - instance_number(Enemy)*xGap-4
y = startY

stunned = false
exposed = false
bleeding = false

healthDiff = 0
updateHealthDiff = false
healthDiffTimer = 0

image_speed = 0

myStats = ds_list_create()
myActions = ds_list_create()

