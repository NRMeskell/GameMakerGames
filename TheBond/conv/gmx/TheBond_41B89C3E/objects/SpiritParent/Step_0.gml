/// @description Move


shadeImage += imageSpeed;
if shadeImage >= sprite_get_number(SpiritShadeSpr)
    shadeImage = 0

if room != 0 and !instance_exists(PanelParent)
    {
    moveLeft = keyboard_check(left)
    moveRight = keyboard_check(right)
    moveUp = keyboard_check(up)
    moveDown = keyboard_check(down)
    
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

