/// @description NewShip

if spriteIndex = EquipHandSpr
    ds_list_add(ItemRunner.floatingItems, MakeHandItem(id))
else if spriteIndex = EquipPantsSpr
    ds_list_add(ItemRunner.floatingItems, MakePantsItem(id))
else if spriteIndex = EquipShirtSpr
    ds_list_add(ItemRunner.floatingItems, MakeShirtItem(id))
else if spriteIndex = EquipHatSpr
    ds_list_add(ItemRunner.floatingItems, MakeHatItem(id))
else if spriteIndex = EquipPetSpr
    ds_list_add(ItemRunner.floatingItems, MakePetItem(id))



ds_list_delete(myStore.items, ds_list_find_index(myStore.items, id))
LoseCargo(0, cost)
    
instance_destroy()
    

