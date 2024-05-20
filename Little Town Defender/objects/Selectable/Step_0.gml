/// @description GoTo MyTHing and select


//Go To My THing
if instance_exists(MyThing) 
    {
    x = MyThing.x
    y = MyThing.y
    sprite_index = MyThing.sprite_index
    mask_index = sprite_index
    image_index = MyThing.image_index
    }
else
    instance_destroy()

///Selection show

if instance_exists(MyThing)
{
if MyThing.Selected = true
    image_blend = c_green
else
    image_blend = c_red
}

///Unselect at end

if TownHall.visible = false
        MyThing.Selected = false  

