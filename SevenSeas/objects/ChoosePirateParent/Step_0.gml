/// @description Slide in

if y = 64 and !collision_line(x,y,x+room_width, y, ChoosePirateParent, false, true) and x < 424 and alarm[0] == -1
    {
    repeat(15)
        {
        if x < 424
            with ChoosePirateParent
                x += 1
        else
            x = 424
        }
    }
    
yWindow = y
xWindow = x

///Stats

//sword, gun, cannon, wheel, sailing, lookout, medic, barder, survival

item[0] = myShirt
item[1] = myHat
item[2] = myPants
item[3] = myLeftHand
item[4] = myRightHand
item[5] = myPet

for(i=0; i<9; i++)
    {
    bonus[i] = 0
    for(r=0; r<array_length_1d(item); r++)
        if r != 3 or !item[r].twoHanded
            bonus[i] += item[r].bonus[i]
    }

for(i=0; i<9; i++)
    statTotal[i] = stat[i] + bonus[i]
    
if myAction[0] != noone
    stars = 1
if myAction[1] != noone
    stars = 2
if myAction[2] != noone
    stars = 3    
    

///Choose Pirate

overSelf = point_in_rectangle(mouse_x, mouse_y, xWindow, yWindow, xWindow + sprite_width, yWindow + sprite_height) and alarm[0] == -1

if overSelf
    {
    if mouse_check_button_pressed(mb_left)
        {
        selected = true
        audio_play_sound(SlidingOpenSnd, 1, false)
        with ChoosePirateParent
            if object_index = other.object_index
                alarm[0] = room_speed/2
        }
    }
    
if alarm[0] > 0
    {
    if selected
        y -= selectedSpeed
    else
        y += selectedSpeed
    
    selectedSpeed += selectedSpeedChange
    }


