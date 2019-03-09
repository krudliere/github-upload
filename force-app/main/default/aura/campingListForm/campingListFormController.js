({
    
    clickCreateItem: function(component,event, helper){		       
        if(helper.validateItemForm(component)){	// If we pass error checking, do some real work
            // Create the new expense
            var newItem = component.get("v.newItem");
            helper.createItem(component, newItem);
        }
    }
})