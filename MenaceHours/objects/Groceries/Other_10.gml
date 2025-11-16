/// @description Draw Mini Game
// You can write your code in this editor

event_inherited()

draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_set_color(c_white)

draw_sprite(GroceryBackSpr, 0, 0, 0)
draw_text(25, 25, gameMX)
draw_text(35, 25, gameMY)

draw_set_valign(fa_center)
draw_set_halign(fa_left)
draw_set_color(c_ltgray)
var timeLeft = max(0, (alarm[0]*99/chooseTime) div 1);
draw_text(18, 52, string_repeat("0", 2-string_length(string(timeLeft))) + string(timeLeft));


var midX = (width/2 + 48/2), midY = height/2;

var disX = 40, disY = 36;
var grocX = midX + 2*sin(alarm[1]/4), grocY = midY + (alarm[1]<1)*sin(current_time/1000)-disY/2-5;
var goodProg = alarm[2] < 1 ? 0 : ((moveTime - alarm[2])/moveTime)

var drawGX = grocX + (goodProg)*(goX-grocX), drawGY = grocY + (goodProg)*(goY-grocY);


draw_sprite_ext(GrocerySpr, currGrocery, drawGX, drawGY, 1, 1, 0, c_white, 1-goodProg)
draw_sprite_outline(GroceryOptionsSpr, 0+3*(over==0), midX-disX, midY+disY/2, 1, 1, 0, c_white, 1, (over==0), c_white)
draw_sprite_outline(GroceryOptionsSpr, 1+3*(over==1), midX, midY+disY/2, 1, 1, 0, c_white, 1, (over==1), c_white)
draw_sprite_outline(GroceryOptionsSpr, 2+3*(over==2), midX+disX, midY+disY/2, 1, 1, 0, c_white, 1, (over==2), c_white)