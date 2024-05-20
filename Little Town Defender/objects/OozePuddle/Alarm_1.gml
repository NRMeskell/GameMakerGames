/// @description Acid

if TownHall.visible = true
{
Target = instance_nearest(x,y,Wall)
    
if place_meeting(x,y,Hero)
    Target = instance_nearest(x,y,Hero)
    
if place_meeting(x,y,MonsterTarget)
    Target = instance_nearest(x,y,MonsterTarget)

if place_meeting(x,y,Target)
with Target
    {
    Health -= 1
    }
    
alarm[1] = AcidRate
}
    


