/// @description Over Scroll

if animating and animation > swordLength + 6
    {
    animating = false
    } 

if scrollWidth == panelWidth
    {
    animation += animationSpeed
    }
    
if animation > sprite_get_number(SeaConqueredSignSpr)-1 or animation < swordLength
    animation = swordLength

overScroll = !animating and point_in_rectangle(mouse_x, mouse_y, x - scrollWidth - edgeWidth, y-panelHeight, x + scrollWidth + edgeWidth, y+panelHeight-5)

//close panel
if overScroll and mouse_check_button_pressed(mb_left)
    {
    event_user(1)
    }
    
//scrolling
if scrollWidth < panelWidth and open
    scrollWidth += min(scrollSpeed, panelWidth - scrollWidth)
else if !open
    {
    scrollWidth -= scrollSpeed 
    if scrollWidth < 0
        instance_destroy()
    }

