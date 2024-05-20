/// @description Create Buttons
    
with instance_create(room_width/2, -50, MenuButton){
    name = "New Game"
    myIndex = 0
    dropY = 220
    myAction = 0
    }
    
with instance_create(room_width/2, -50, MenuButton){
    name = "Load Game"
    myIndex = 2
    dropY = 275
    myAction = 1
    }
    
with instance_create(room_width/2, -50, MenuButton){
    name = "Exit"
    myIndex = 2
    dropY = 320
    myAction = 2
    }
    
instance_create(room_width/2, -128, TitleObject)

