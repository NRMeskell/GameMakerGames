/// @description Draw self

if global.golfMapType = "country"
    {
    waterSpeed = 100
    image_index = 0
    }
else{
     waterSpeed = 200
     image_index = 1
     }
     
splitPoint = ((current_time/waterSpeed)) % sprite_width
draw_sprite_part(sprite_index, image_index, splitPoint, 0, sprite_width - splitPoint, sprite_height, x, y) 
draw_sprite_part(sprite_index, image_index, 0, 0, splitPoint, sprite_height, x + sprite_width - splitPoint, y) 

