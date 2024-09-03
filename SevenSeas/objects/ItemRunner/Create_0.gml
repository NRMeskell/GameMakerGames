/// @description Level Vars

floatingItems = ds_list_create()

///Hat Vars

//http://www.thewayofthepirates.com/pirate-weapons/pirate-weapons/

hatLevel[0] = ds_list_create()
hatLevel[1] = ds_list_create()

ds_list_add(hatLevel[0], 0,1,2,3,4,5,6,7,10)
ds_list_add(hatLevel[1], 8,9,11,12,13,14,15,16,17)

deckhandHats = ds_list_create()
ds_list_add(deckhandHats, 0,1,2,3, 6,7,8,9, 12,13,14,15)

//names
hatNames[0] = "headband"
hatNames[1] = "leather cap"
hatNames[2] = "wool cap"
hatNames[3] = "head wrap"
hatNames[4] = "brimmed hat"
hatNames[5] = "linen scarf"

hatNames[6] = "head wrap"
hatNames[7] = "bandana"
hatNames[8] = "turban"
hatNames[9] = "neckerchief"
hatNames[10] = "tricorn"
hatNames[11] = "bicorn"


hatNames[12] = "sailor cap"
hatNames[13] = "linen bandana"
hatNames[14] = "head scarf"
hatNames[15] = "sheepskin cap"
hatNames[16] = "gold tricorn"
hatNames[17] = "feathered hat"

//info
hatInfo[0] = "a cloth strip tied around the head"
hatInfo[1] = "simple and effetive garb"
hatInfo[2] = "warm and itchy"
hatInfo[3] = "a thin cloth covering"
hatInfo[4] = "keeps the weather off the shoulders"
hatInfo[5] = "fashionable cloth wrapping"

hatInfo[6] = "leather strips"
hatInfo[7] = "a well-made bandana"
hatInfo[8] = "A ball of quality fabric"
hatInfo[9] = "loosely fit and tied"
hatInfo[10] = "a classic hat for pirates"
hatInfo[11] = "simple and elegant"

hatInfo[12] = "simple and practicle hat"
hatInfo[13] = "a jewel-covered headpiece"
hatInfo[14] = "wraps of leather and cloth"
hatInfo[15] = "warm and comfortable"
hatInfo[16] = "an intimidating feathered ornament"
hatInfo[17] = "a fashionable feather-covered hat"

///Pants Vars

//http://www.thewayofthepirates.com/pirate-weapons/pirate-weapons/

pantsLevel[0] = ds_list_create()
pantsLevel[1] = ds_list_create()
pantsLevel[2] = ds_list_create()

ds_list_add(pantsLevel[0], 0,2,3)
ds_list_add(pantsLevel[1], 1,4,5,6,7,8,9)
ds_list_add(pantsLevel[2], 10,11,12,13,14,15,16,17)

deckhandPants = ds_list_create()
ds_list_add(deckhandPants, 0,1,2,7,8,9,12,13,14,15)

//names
pantsNames[0] = "shorts"
pantsNames[1] = "pantaloons"
pantsNames[2] = "pinstripes"
pantsNames[3] = "torn trousers"
pantsNames[4] = "sashed pants"
pantsNames[5] = "belted pants"

pantsNames[6] = "sail trousers"
pantsNames[7] = "knee breech"
pantsNames[8] = "banded linens"
pantsNames[9] = "loose pants"
pantsNames[10] = "cotton pants"
pantsNames[11] = "leather pants"


pantsNames[12] = "linen pants"
pantsNames[13] = "harem pants"
pantsNames[14] = "breeches"
pantsNames[15] = "tucked pants"
pantsNames[16] = "buckled boots"
pantsNames[17] = "knee boots"

//info
pantsInfo[0] = "basic covering"
pantsInfo[1] = "baggy pants allows easy movement"
pantsInfo[2] = "stripes disguise any stains"
pantsInfo[3] = "old torn pants"
pantsInfo[4] = "a clean pair of pants"
pantsInfo[5] = "simple and clean"

pantsInfo[6] = "practical trousers for a ship"
pantsInfo[7] = "knee-length breeches and footwear"
pantsInfo[8] = "a thin and free covering"
pantsInfo[9] = "a practical pair of trousers"
pantsInfo[10] = "cotton pants and buckle"
pantsInfo[11] = "a good choice for a steathly pirate"

pantsInfo[12] = "a well fastened pair of pants"
pantsInfo[13] = "baggy and strong to allow swift movement"
pantsInfo[14] = "a classic look on any ship"
pantsInfo[15] = "practical and intimidating"
pantsInfo[16] = "comfortable for any fashionable sailor"
pantsInfo[17] = "flashy and fancy"

///Shirt Vars

//http://www.thewayofthepirates.com/pirate-weapons/pirate-weapons/

shirtLevel[0] = ds_list_create()
shirtLevel[1] = ds_list_create()
shirtLevel[2] = ds_list_create()

ds_list_add(shirtLevel[0], 0,2,3,5)
ds_list_add(shirtLevel[1], 1,4,6,7,8,10,11,12,13,14)
ds_list_add(shirtLevel[2], 9,15,16,17,18,19,20,21,22,23,24,25,26)

deckhandShirts = ds_list_create()
ds_list_add(deckhandShirts, 0,1,3,4,5,9,10,11,12,13,14,18,19,20,21,22,23)

//names
shirtNames[0] = "cotton shirt"
shirtNames[1] = "large vest"
shirtNames[2] = "baldric"
shirtNames[3] = "small vest"
shirtNames[4] = "vested shirt"
shirtNames[5] = "torn sashes"
shirtNames[6] = "cotton jacket"
shirtNames[7] = "weatherdown"
shirtNames[8] = "formal vest"

shirtNames[9] = "sashes"
shirtNames[10] = "pinstripes"
shirtNames[11] = "vested shirt"
shirtNames[12] = "tunic"
shirtNames[13] = "padded shirt"
shirtNames[14] = "linen shirt"
shirtNames[15] = "waistcoat"
shirtNames[16] = "overcoat"
shirtNames[17] = "formal dress"

shirtNames[18] = "buttoned vest"
shirtNames[19] = "linen dress"
shirtNames[20] = "tailored vest"
shirtNames[21] = "sailor's tunic"
shirtNames[22] = "trimmed vest"
shirtNames[23] = "sheepskin"
shirtNames[24] = "velvet coat"
shirtNames[25] = "tailcoat"
shirtNames[26] = "frock coat"

//info
shirtInfo[0] = "a small shirt"
shirtInfo[1] = "covers only the back"
shirtInfo[2] = "an outfit made for utility"
shirtInfo[3] = "a good choice with many pockets"
shirtInfo[4] = "a more formal vest"
shirtInfo[5] = "an old shirt spiced with torn fabric"
shirtInfo[6] = "both practical and fashionable"
shirtInfo[7] = "keeps out most water and sun"
shirtInfo[8] = "a simple and classy look"

shirtInfo[9] = "a tasteful covering of light cloth"
shirtInfo[10] = "simple and pinstripped"
shirtInfo[11] = "a common tunic for fearsome pirates"
shirtInfo[12] = "simple and well crafted for sailors"
shirtInfo[13] = "drawstrings help in harsh weather"
shirtInfo[14] = "a light robe of thin fabric"
shirtInfo[15] = "a classic look for any pirate"
shirtInfo[16] = "made for any occasion"
shirtInfo[17] = "a fearsome and fashionable outfit"

shirtInfo[18] = "a well-fit and classy vest"
shirtInfo[19] = "light-weight and frilly"
shirtInfo[20] = "a well-fit and classy coat"
shirtInfo[21] = "kept clean and propper"
shirtInfo[22] = "a fancy seaworthy vest"
shirtInfo[23] = "incredibly warm and soft"
shirtInfo[24] = "Made with the finest material"
shirtInfo[25] = "a full-length coat worthy of a captian"
shirtInfo[26] = "a coat to bring terror to enemies"

///Hand Vars

//http://www.thewayofthepirates.com/pirate-weapons/pirate-weapons/

handLevel[0] = ds_list_create()
handLevel[1] = ds_list_create()

ds_list_add(handLevel[0], 0,1,2,3,5,7,8,9)
ds_list_add(handLevel[1], 4,6,10,11,12,13,14,15)

twoHandedList = ds_list_create()
ds_list_add(twoHandedList, 8, 9, 14, 15)
melleList = ds_list_create()
ds_list_add(melleList, 0,1,4,5,10,11)


//names
handNames[0] = "dirk"
handNames[1] = "dagger"
handNames[2] = "pocket pistol"
handNames[3] = "derringer"
handNames[4] = "cutlass"
handNames[5] = "boarding axe"
handNames[6] = "flintlock"
handNames[7] = "multi-barrel"
handNames[8] = "musket"
handNames[9] = "musketoon"
handNames[10] = "rapier"
handNames[11] = "scimitar"
handNames[12] = "wheellock"
handNames[13] = "volley gun"
handNames[14] = "rifle"
handNames[15] = "blunderbuss"

//info
handInfo[0] = "perfect for quick stabs and slashes"
handInfo[1] = "practical and sharp: good for cutting"
handInfo[2] = "a small mischievous pistol"
handInfo[3] = "surprisingly powerful and easy to use"
handInfo[4] = "a good sword looking for trouble"
handInfo[5] = "great for cutting rope"
handInfo[6] = "a simple tool for gettting the job done"
handInfo[7] = "a powerful multi-barreled handgun"
handInfo[8] = "long-barreled and great for sniping"
handInfo[9] = "short but strong"
handInfo[10] = "a classy sword for classy pirates"
handInfo[11] = "a heavy sword with a giant curved blade"
handInfo[12] = "an ornate pistol; accurate and powerful"
handInfo[13] = "fires all barrels at once!"
handInfo[14] = "a better musket"
handInfo[15] = "a deady hand-cannon"

//level 1
handAcc[0] = 50
handAcc[1] = 40
handAcc[2] = 35
handAcc[3] = 20

handDam[0] = 15
handDam[1] = 20
handDam[2] = 10
handDam[3] = 20

//level 2
handAcc[4] = 60
handAcc[5] = 30
handAcc[6] = 35
handAcc[7] = 30
handAcc[8] = 60
handAcc[9] = 40

handDam[4] = 20
handDam[5] = 50
handDam[6] = 20
handDam[7] = 25
handDam[8] = 35
handDam[9] = 60

//level 3
handAcc[10] = 80
handAcc[11] = 45
handAcc[12] = 40
handAcc[13] = 20
handAcc[14] = 60
handAcc[15] = 30

handDam[10] = 25
handDam[11] = 45
handDam[12] = 30
handDam[13] = 55
handDam[14] = 35
handDam[15] = 75

///Cargo Vars

global.foodQuality = 0

cargoCost[0] = 1
cargoCost[1] = 10
cargoCost[2] = 2
cargoCost[3] = 1
cargoCost[4] = 1
cargoCost[5] = 4
cargoCost[6] = 3
cargoCost[7] = 10

cargoName[0] = "gold"
cargoName[1] = "jewels"
cargoName[2] = "c-balls"
cargoName[3] = "planks"
cargoName[4] = "food"
cargoName[5] = "grog"
cargoName[6] = "food"
cargoName[6] = "pearls"

