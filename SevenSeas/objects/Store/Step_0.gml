/// @description Display objects/update canTake

previewItem = false
event_user(3)

//update views
for(i=currentView; i<min(ds_list_size(items), currentView + maxView); i++)
    {
	instance_activate_object(ds_list_find_value(items, i))	
    currentItem = ds_list_find_value(items, i)
    with currentItem
        {
        viewed = true
        drawX = other.x - 65
        drawY = other.y - 55 + (other.i - other.currentView)*40
        myStore = other.id
		}
    }
    
if point_in_rectangle(window_view_mouse_get_x(0), window_view_mouse_get_y(0), x - sprite_width/2, y - sprite_height/2, x + sprite_width/2, y + sprite_height/2)
    {
    if mouse_wheel_down() and (currentView + maxView < ds_list_size(items))
        currentView ++
    if mouse_wheel_up() and currentView > 0
        currentView --
    }

///Over Buttons

overLeft = point_in_rectangle(window_view_mouse_get_x(0), window_view_mouse_get_y(0), x-sprite_get_width(sprite_index)/2, y + sprite_get_height(sprite_index)/2 - 30, x-1, y+sprite_get_height(sprite_index)/2)
overRight = point_in_rectangle(window_view_mouse_get_x(0), window_view_mouse_get_y(0), x+1, y + sprite_get_height(sprite_index)/2 - 30, x+sprite_get_width(sprite_index)/2, y+sprite_get_height(sprite_index)/2)

if overLeft and !instance_exists(DumpItem)
    {
    image_index = 1
    if mouse_check_button_pressed(mb_left)
        event_user(1)
    }
else if overRight and !instance_exists(DumpItem)
    {
    image_index = 2
    if mouse_check_button_pressed(mb_left)
        event_user(0)
    }
else
    image_index = 0
    
image_index = image_index + 3*(!canTake)

/*if keyboard_check_pressed(vk_escape)
   event_user(0) */

/* */
///MakeListSmaller

if ds_list_size(items) > maxView
    {
    ds_list_delete(items, maxView)
    }
	
/* */
/*  */
