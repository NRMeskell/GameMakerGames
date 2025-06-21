/// @description Draw Attack

damageDrawX = 365 + (70)*!(shipTarget == CombatRunner)
damageDrawY = 130 + 15*waiting

newShipHealth = 0
newCrewHealth = 0

with crewTarget
    other.newCrewHealth += myHealth
with shipTarget
    other.newShipHealth += myHealth
    
dSD = (prevShipHealth - newShipHealth) div 1
dCD = (prevCrewHealth - newCrewHealth) div 1

drawDamage = abs(dSD) + abs(dCD)
damageSign = sign(dSD + dCD)
if showDamage
    {
    if alarm[0] > 0
        {
        if (shipTarget == CombatRunner)
            draw_set_halign(fa_left)
        else
            draw_set_halign(fa_right)
            
        draw_set_valign(fa_center)
        draw_set_font(global.LargePirateFont)
        if object_index != ShipSurgery
            draw_set_color(merge_color(c_red, c_black, 0.2))
        else
            draw_set_color(merge_color(c_green, c_black, 0.2))
            
        if object_index != ShipShipRun
            draw_text(damageDrawX, damageDrawY, string_hash_to_newline(drawDamage))
        else
            draw_text(damageDrawX, damageDrawY, string_hash_to_newline(damage))
            
        draw_set_halign(fa_center)
        if criticalHit
            draw_text(damageDrawX-15, damageDrawY-20, string_hash_to_newline("CRITICAL HIT!"))
        }
    else if alarm[0] == 0{
        if (shipTarget == CombatRunner){
            CombatRunner.playerDamage += drawDamage
            CombatRunner.playerTurnDamage = drawDamage
            }
        else{
            CombatRunner.enemyDamage += drawDamage
            CombatRunner.enemyTurnDamage = drawDamage
            }
        }
    }

draw_sprite_part_ext(PlayerAttackActionsSpr, myButton.spriteNumber, 4, 4, 25, 24, damageDrawX + 30*(-1 + 2*!(shipTarget == CombatRunner)), damageDrawY - 13, -1+2*(shipTarget == CombatRunner), 1, c_white, 1)

if waiting and CombatRunner.alarm[4] > 0{
    draw_set_valign(fa_center)
    if (shipTarget == CombatRunner)
        draw_set_halign(fa_left)
    else
        draw_set_halign(fa_right)
    draw_set_font(global.LargePirateFont)
    draw_set_color(merge_color(c_yellow,c_black,0.4))
    draw_text(damageDrawX, damageDrawY, string_hash_to_newline(priority))
    draw_set_font(global.PirateFont)
    }