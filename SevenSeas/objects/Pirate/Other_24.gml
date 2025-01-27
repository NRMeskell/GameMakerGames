/// @description Update Pirate Stats
// You can write your code in this editor

item[0] = myShirt
item[1] = myHat
item[2] = myPants
item[3] = myRightHand
item[4] = myLeftHand
item[5] = myPet

itemString[0] = "shirt"
itemString[1] = "hat"
itemString[2] = "pants"
itemString[3] = "hands"
itemString[4] = "hands"
itemString[5] = "item"

for(i=0; i<9; i++){
    statString[i] = ""
    bonus[i] = 0
    haveItem[i] = false //tracks whether to display the icon
    
    for(r=0; r<array_length_1d(item); r++){
        itemBonus = item[r].bonus[i]
        if (r==3){
            if (item[r] != item[r+1]) //calculate left hand bonus
                itemBonus += item[r+1].bonus[i]
            
            r++ //skip left hand in loop
            }
        if itemBonus > 0{
            statString[i] += itemString[r] + " +" + string(itemBonus) + "#"
            haveItem[i] = true
            }
        if itemBonus < 0
            statString[i] += itemString[r] + " -" + string(abs(itemBonus)) + "#"
        
        bonus[i] += itemBonus
        }
    if string_length(statString[i]) > 0
        string_delete(statString[i], string_length(statString[i]), 1)
    }

for(i=0; i<9; i++){
    statTotal[i] = bonus[i]
    if ((i != 0) and (i != 1)) or (bonus[i] != 0)
        {
        statTotal[i] += stat[i]
        if stat[i] > 0
            statString[i] = "pirate +" + string(stat[i]) + "#" + statString[i]
        if stat[i] < 0
            statString[i] = "pirate -" + string(abs(stat[i])) + "#" + statString[i]
        }
    statTotal[i] = max(0, statTotal[i])
    }   