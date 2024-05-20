ds_list_clear(reputationTypes)
for(var i=0; i<ds_list_size(global.reputation); i++){
	var currentItem = ds_list_find_value(global.reputation, i)
	if ds_list_find_index(reputationTypes, currentItem) == -1
		ds_list_add(reputationTypes, currentItem[0])
}

for(var i=0; i<ds_list_size(reputationTypes); i++){
	var currentItem = ds_list_find_value(reputationTypes, i)
	if ds_list_find_index(reputationTypes, currentItem) == -1
		ds_list_add(reputationTypes, currentItem[0])
}