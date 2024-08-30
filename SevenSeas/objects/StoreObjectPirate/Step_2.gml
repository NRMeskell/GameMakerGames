/// @description Update Stats
// You can write your code in this editor

item[0] = myShirt
item[1] = myHat
item[2] = myPants
item[3] = myLeftHand
item[4] = myRightHand
item[5] = myPet

for(i=0; i<9; i++){
    bonus[i] = 0
    for(r=0; r<array_length_1d(item); r++)
        if r != 3 or !item[r].twoHanded
            bonus[i] += item[r].bonus[i]
    }

for(i=0; i<9; i++)
    statTotal[i] = stat[i] + bonus[i]
