/// @description Control Item selections

global.itemSelected = false
with ItemParent{
    if selected and state == "equipped"
        global.itemSelected = true
	}
      
	  
	  
