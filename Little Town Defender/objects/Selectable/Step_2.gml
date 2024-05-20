/// @description GoTo MyTHing and select


//Go To My THing
if instance_exists(MyThing) 
    {
    x = MyThing.x
    y = MyThing.y
    sprite_index = MyThing.sprite_index
    
    mask_index = sprite_index
    
    depth = MyThing.depth
    }
else
    instance_destroy()

