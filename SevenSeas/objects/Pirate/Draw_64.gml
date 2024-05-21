var __b__;
__b__ = action_if_variable(selected, true, 0);
if __b__
{
__b__ = action_if_variable(instance_exists(Defeat), false, 0);
if __b__
{
{
///Draw Pirate Menu


draw_sprite_ext(PirateSheetSpr, 0, xWindow, yWindow, size, size, 0, c_white, 1)

if overClose
    draw_sprite(EndCombatSpr, 1, xWindow + sprite_get_width(PirateSheetSpr)-2, yWindow+2)
else
    draw_sprite(EndCombatSpr, 0, xWindow + sprite_get_width(PirateSheetSpr)-2, yWindow+2)

DrawPirate(xWindow+xPicture, yWindow+yPicture)

//draw morale markers
moraleXLow = 52-2*stars;
moraleXHigh = 122+2*stars;
moraleY = 137;
moraleXWidth = moraleXHigh-moraleXLow;
w = (sprite_get_width(MoraleSymbolSpr)/2+4-stars)
middle = moraleXLow + (moraleMax[stars]*w/moraleXWidth - 2*w/moraleXWidth + 2)/(moraleMax[stars]+2)*moraleXWidth
draw_sprite_ext(MoraleSymbolSpr, myMainPer, xWindow  + middle, yWindow+moraleY, size, size, 0, c_white, 1)
for(var i=-3; i<min(morale, 0); i++) draw_sprite(MoraleTicksSpr, 0, xWindow + moraleXLow + (3+i)*((middle-w - moraleXLow)/2), yWindow+moraleY)
for(var i=min(morale, 0); i<0; i++) draw_sprite(MoraleTicksSpr, 1, xWindow + moraleXLow + (3+i)*((middle-w - moraleXLow)/2), yWindow+moraleY)
for(var i=0; i<max(0, morale); i++)  draw_sprite(MoraleTicksSpr, 2, xWindow + (middle + w) + (i)*((moraleXHigh - (middle+w))/(moraleMax[stars]-1)), yWindow+moraleY)
for(var i=max(0, morale); i<moraleMax[stars]; i++)  draw_sprite(MoraleTicksSpr, 3, xWindow + (middle + w) + (i)*((moraleXHigh - (middle+w))/(moraleMax[stars]-1)), yWindow+moraleY)

if !injured
    draw_sprite(PirateLifeSpr, -1+sprite_get_number(PirateLifeSpr)*myHealth/maxHealth, xWindow, yWindow)
else
    draw_sprite(PirateLifeInjuredSpr, -1+sprite_get_number(PirateLifeSpr)*myHealth/maxHealth, xWindow, yWindow)

draw_sprite(PirateLifeLegsSpr, legLostRight + legLostLeft, xWindow, yWindow)

/* */
///Draw Name Menu

draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_color(c_black)
draw_set_font(global.PirateFont)

draw_text_transformed(xWindow+(sprite_get_width(PirateSheetSpr)/2)*size, yWindow+19*size, string_hash_to_newline(name), size, size, 0)

/* */
///Draw Equipment

draw_sprite_ext(EquipSlotSpr, overHat or myHat.selected, xWindow+drawX1, yWindow+drawY1, size, size, 0, c_white, 1)
draw_sprite_ext(EquipSlotSpr, overShirt or myShirt.selected, xWindow+drawX2, yWindow+drawY1, size, size, 0, c_white, 1)
draw_sprite_ext(EquipSlotSpr, overRightHand or myRightHand.selected, xWindow+drawX1, yWindow+drawY2, size, size, 0, c_white, 1)
draw_sprite_ext(EquipSlotSpr, overLeftHand or myLeftHand.selected, xWindow+drawX2, yWindow+drawY2, size, size, 0, c_white, 1)
draw_sprite_ext(EquipSlotSpr, overPants or myPants.selected, xWindow+drawX2, yWindow+drawY3, size, size, 0, c_white, 1)
draw_sprite_ext(EquipSlotSpr, overPet or myPet.selected, xWindow+drawX1, yWindow+drawY3, size, size, 0, c_white, 1)

if myHat.itemName != "none"
    {
    DrawItem(EquipHatSpr, myHat.itemNumber, myHat.myColor, xWindow+drawX1-12, yWindow+drawY1-12, 0, 0, sprite_get_width(EquipHatSpr), sprite_get_height(EquipHatSpr))
    }
else
    draw_sprite_ext(SlotShownSpr, 2, xWindow+drawX1, yWindow+drawY1, size, size, 0, c_white, 1)    
    

if myShirt.itemName != "none"
    {
    DrawItem(EquipShirtSpr, myShirt.itemNumber, myShirt.myColor, xWindow+drawX2-12, yWindow+drawY1-12, 0, 0, sprite_get_width(EquipShirtSpr), sprite_get_height(EquipShirtSpr))
    }
else
    draw_sprite_ext(SlotShownSpr, 1, xWindow+drawX2, yWindow+drawY1, size, size, 0, c_white, 1)
 
if myPants.itemName != "none"
    {
    DrawItem(EquipPantsSpr, myPants.itemNumber, myPants.myColor, xWindow+drawX2-12, yWindow+drawY3-12, 0, 0, sprite_get_width(EquipPantsSpr), sprite_get_height(EquipPantsSpr))
    }
else
    draw_sprite_ext(SlotShownSpr, 4, xWindow+drawX2, yWindow+drawY3, size, size, 0, c_white, 1)
 
if myPet.itemName != "none"
    {
    DrawItem(EquipPetSpr, myPet.itemNumber, myPet.myColor, xWindow+drawX1-12, yWindow+drawY3-12, 0, 0, sprite_get_width(EquipPetSpr), sprite_get_height(EquipPetSpr))
    }
else
    draw_sprite_ext(SlotShownSpr, 5, xWindow+drawX1, yWindow+drawY3, size, size, 0, c_white, 1)
 
    
if handLostLeft
    draw_sprite_ext(SlotShownSpr, 3, xWindow+drawX2, yWindow+drawY2, size, size, 0, c_white, 1)  
else
    {
    if myLeftHand.itemName != "none"
        DrawItem(EquipHandSpr, myLeftHand.itemNumber, myLeftHand.myColor, xWindow+drawX2-12, yWindow+drawY2-12, 0, 0, sprite_get_width(EquipHandSpr), sprite_get_height(EquipHandSpr))
    else
        draw_sprite_ext(SlotShownSpr, 0, xWindow+drawX2, yWindow+drawY2, size, size, 0, c_white, 1)    
        
    }
    
if handLostRight
    draw_sprite_ext(SlotShownSpr, 3, xWindow+drawX1+1, yWindow+drawY2, -size, size, 0, c_white, 1)
else
    {    
    if myRightHand.itemName != "none" 
        {
        DrawItem(EquipHandSpr, myRightHand.itemNumber, myRightHand.myColor, xWindow+drawX1-12, yWindow+drawY2-12, 0, 0, sprite_get_width(EquipHandSpr), sprite_get_height(EquipHandSpr))
		if myRightHand.twoHanded == true
            DrawItem(EquipHandSpr, myRightHand.itemNumber, myRightHand.myColor, xWindow+drawX2-12, yWindow+drawY2-12, 0, 0, sprite_get_width(EquipHandSpr), sprite_get_height(EquipHandSpr))
		}
    else
        draw_sprite_ext(SlotShownSpr, 0, xWindow+drawX1+1, yWindow+drawY2, -size, size, 0, c_white, 1)
    }    
        
    

/* */
///Draw Stats and Actions

//Draw Bonuses
drawStartY = yWindow + 170
drawStatDisX = 48
drawStatDisY = 23
textShift = 28
centerOffset = 5

rowStart[0] = xWindow+sprite_get_width(PirateSheetSpr)/2 + centerOffset
rowStart[1] = xWindow+sprite_get_width(PirateSheetSpr)/2 + centerOffset
rowStart[2] = xWindow+sprite_get_width(PirateSheetSpr)/2 + centerOffset

//Collect stat info
r = 0
numBonus = 0
for(i=0; i < array_length_1d(bonus); i++)
    {
    if (haveItem[i] = true or statTotal[i] > 0)
        {
        rowStart[r div 3] -= drawStatDisX/2
        numBonus ++
        r ++
        }
    }
//Draw Stats  
r=0 
for(i=0; i < array_length_1d(bonus); i++)
    {
    if (haveItem[i] = true or statTotal[i] > 0)
        {
        draw_set_halign(fa_left)
        draw_set_valign(fa_center)
        draw_set_color(make_color_rgb(158,126,2))
        draw_set_font(global.LargePirateFont)
        drawBonusX = rowStart[r div 3] + drawStatDisX*(r mod 3)
        drawBonusY = drawStartY - drawStatDisY*((numBonus - 1) div 3)/2 + drawStatDisY*(r div 3)
        
        draw_sprite(StatSymbolSpr, i, drawBonusX, drawBonusY)// + 47*(sprite_index == EquipHandSpr))
        draw_text(drawBonusX + textShift, drawBonusY + sprite_get_height(StatSymbolSpr)/2, string_hash_to_newline(statTotal[i]))
        draw_set_font(global.PirateFont)
        r ++
        }
    }

//Draw Details  
r=0 
for(i=0; i < array_length_1d(bonus); i++)
    {
    if (haveItem[i] = true or statTotal[i] > 0)
        {
        draw_set_halign(fa_left)
        draw_set_valign(fa_center)
        draw_set_color(make_color_rgb(158,126,2))
        drawBonusX = rowStart[r div 3] + drawStatDisX*(r mod 3)
        drawBonusY = drawStartY - drawStatDisY*((numBonus - 1) div 3)/2 + drawStatDisY*(r div 3)
        draw_set_font(global.PirateFont)
        
        if point_in_rectangle(mouse_x, mouse_y, drawBonusX, drawBonusY + 2, drawBonusX + sprite_get_width(StatSymbolSpr) + textShift - 15, drawBonusY - 4 + sprite_get_height(StatSymbolSpr)){
            drawXPoint = ((drawBonusX) + (drawBonusX + sprite_get_width(StatSymbolSpr) + textShift - 15))/2
            drawYPoint = drawBonusY + 1
            
            draw_sprite_part(PirateLifeDisplaySpr, 2, 0, 0, sprite_get_width(PirateLifeDisplaySpr), 10 + string_height_ext(string_hash_to_newline(statString[i]), 12, 100) + 1, drawXPoint - sprite_get_width(PirateLifeDisplaySpr)/2, drawBonusY)
            draw_sprite_part(PirateLifeDisplaySpr, 2, 0, 0, sprite_get_width(PirateLifeDisplaySpr), 5, drawXPoint - sprite_get_width(PirateLifeDisplaySpr)/2, drawBonusY + 10 + string_height_ext(string_hash_to_newline(statString[i]), 12, 100))
            draw_set_halign(fa_center)
            draw_set_valign(fa_top)
            draw_text_ext(drawXPoint, drawYPoint + 8, string_hash_to_newline(statString[i]), 12, 100)
            }
        r ++
        }
    }
    
//Draw Actions
for(i=0; i<array_length_1d(myAction); i++)
    {
    actionStartX = 32 + 16
    actionStartY = 215 + 16
    if myAction[i] != noone
        {
        DrawAction(myAction[i], xWindow + actionStartX + 39*i, yWindow + actionStartY, 1)
        }
    }

/* */
///Draw walk plank

if selected = true// and Ship.portSelect = true
    {
    if !overDump
        draw_sprite(ShipSlotSpr, 3, dumpX, dumpY)
    else
        draw_sprite(ShipSlotSpr, 9, dumpX, dumpY)
    }


/* */
///Draw Action Descriptions
    
//Draw Health
healthX = 15
healthY = 250
healthH = 16
if point_in_rectangle(mouse_x, mouse_y, xWindow + healthX, yWindow + healthY, xWindow + sprite_get_width(PirateSheetSpr) - healthX, yWindow + healthY + healthH) and !instance_exists(DumpItem)
    {
    draw_sprite(PirateLifeDisplaySpr, 0, xWindow + sprite_get_width(PirateSheetSpr)/2, yWindow + healthY + healthH/2)
    draw_set_color(c_black)
    draw_set_font(global.PirateFont)
    draw_set_valign(fa_center)
    draw_set_halign(fa_center)
    draw_text(xWindow + sprite_get_width(PirateSheetSpr)/2, yWindow + healthY + healthH/2 + 1, string_hash_to_newline(string(ceil(myHealth)) + "/" + string(maxHealth)))
    }
    
//draw morale info
if point_in_rectangle(mouse_x, mouse_y, xWindow + 68, yWindow + 126, xWindow + 85, yWindow + 146) and !instance_exists(DumpItem)
    {
    draw_sprite_part(PirateLifeDisplaySpr, 1, 0, 0, sprite_get_width(PirateLifeDisplaySpr), 20 + 5*(ds_list_size(myMoraleReasons)>0) + 14*ds_list_size(myMoraleReasons)/2, xWindow + sprite_get_width(PirateSheetSpr)/2 - sprite_get_width(PirateLifeDisplaySpr)/2, yWindow + 144 - healthH/2 - 10)
    draw_sprite_part(PirateLifeDisplaySpr, 1, 0, sprite_get_height(PirateLifeDisplaySpr)-5, sprite_get_width(PirateLifeDisplaySpr), 5*(ds_list_size(myMoraleReasons)>0), xWindow + sprite_get_width(PirateSheetSpr)/2 - sprite_get_width(PirateLifeDisplaySpr)/2, yWindow + 144 - healthH/2 + 15 + 14*ds_list_size(myMoraleReasons)/2)
    draw_set_color(c_black)
    draw_set_halign(fa_center)
    draw_set_valign(fa_center)
    draw_set_font(global.PirateFont)
    draw_text(xWindow + sprite_get_width(PirateSheetSpr)/2, yWindow + 144 - healthH/2 + 1, string_hash_to_newline(displayPer[myMainPer])) 
    
    for(i=0; i<ds_list_size(myMoraleReasons); i+=2){
        checkReason[0] = ds_list_find_value(myMoraleReasons, i+1)
        checkReason[1] = ds_list_find_value(myMoraleReasons, i)
        draw_set_halign(fa_left)
        draw_set_color(c_black)
        draw_text(xWindow + sprite_get_width(PirateSheetSpr)/2 - 50, yWindow + 144 - healthH/2 + 1 + 22 + 14*(i/2), string_hash_to_newline(checkReason[0]))
        
        if checkReason[1] > 0{
            addOn = "+"
            draw_set_color(merge_color(c_green, c_black, 0.1))
            }
        else{
            addOn = "-"
            draw_set_color(merge_color(c_red, c_black, 0.1))
            }
           
        draw_set_halign(fa_right) 
        draw_text(xWindow + sprite_get_width(PirateSheetSpr)/2 + 50, yWindow + 144 - healthH/2 + 1 + 22 + 14*(i/2), string_hash_to_newline(string_repeat("+", (addOn="+")) + string(checkReason[1])))
        }
    }
    
//Draw Actions
for(i=0; i<array_length_1d(myAction); i++)
    {
    if myAction[i] != noone  and !instance_exists(DumpItem)
        {                
        //Draw stat Info
        if point_in_rectangle(mouse_x, mouse_y, xWindow + actionStartX + 39*i - 16, yWindow + actionStartY - 16, xWindow + actionStartX + 40*i + 16, yWindow + actionStartY + 16)
            {
            startX = xWindow - sprite_get_width(ActionInfoSpr)/2 + 8 + sprite_get_width(PirateSheetSpr)/2
            drawInfoY = yWindow + actionStartY - 60
            DrawActionInfo(myAction[i], startX, drawInfoY, true, "pirate", undefined)
            }
        }
    }
/* */
}
}
}
/*  */

    

