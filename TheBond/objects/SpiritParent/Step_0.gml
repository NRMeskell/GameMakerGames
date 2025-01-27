/// @description Move

//check if moving via keyboard
if object_index = WhiteSpirit and room != MenuRoom and !instance_exists(PanelParent){
	if keyboard_check_pressed(vk_anykey)
		GameRunner.keyboard = true
	if mouse_check_button_pressed(mb_left)
		GameRunner.keyboard = false
}


shadeImage += imageSpeed;
if shadeImage >= sprite_get_number(SpiritShadeSpr)
    shadeImage = 0

if room != MenuRoom and !instance_exists(PanelParent)
    {
	if GameRunner.keyboard{	
	    moveLeft = keyboard_check(left)
	    moveRight = keyboard_check(right)
	    moveUp = keyboard_check(up)
	    moveDown = keyboard_check(down)
	}else{
		moveLeft = false
		moveRight = false
		moveUp = false
		moveDown = false
		for(var i=0; i<2; i++){
			if device_mouse_check_button_pressed(i, mb_left) and abs(mySide - device_mouse_x(i)) < room_width/2 - 25{
				pushx = device_mouse_x(i)
				pushy = device_mouse_y(i)
			}
			
			if device_mouse_check_button(i, mb_left) and abs(mySide - device_mouse_x(i)) < room_width/2 - 25{
				moveLeft = device_mouse_x(i) - pushx < -16*room_width/window_get_width()
				moveRight = device_mouse_x(i) - pushx > 16*room_width/window_get_width()
				moveUp = device_mouse_y(i) - pushy < -16*room_width/window_get_width()
				moveDown = device_mouse_y(i) - pushy > 16*room_width/window_get_width()
			}
		}
	}
    
     if moveLeft{       
        image_xscale = -1 
        for(i=0; i<moveSpeed; i++){
            canMove = true
            for(r=0; r<array_length_1d(myWalls); r++){
                if place_meeting(x-1, y, myWalls[r])
                    canMove = false
                }
            if canMove
                x -= 1
            }
        }
        
    if moveRight{  
        image_xscale = 1      
        for(i=0; i<moveSpeed; i++){
            canMove = true
            for(r=0; r<array_length_1d(myWalls); r++){
                if place_meeting(x+1, y, myWalls[r])
                    canMove = false
                }
            if canMove
                x += 1
            }
        }
        
    if moveUp{        
        for(i =0; i<moveSpeed; i++){
            canMove = true
            for(r=0; r<array_length_1d(myWalls); r++){
                if place_meeting(x, y-1, myWalls[r])
                    canMove = false
                }
            if canMove
                y -= 1
            }
        }
        
    if moveDown{        
        for(i=0; i<moveSpeed; i++){
            canMove = true
            for(r=0; r<array_length_1d(myWalls); r++){
                if place_meeting(x, y+1, myWalls[r])
                    canMove = false
                }
            if canMove
                y += 1
            }
        }
    }
    
    x = round(x)
    y = round(y)

