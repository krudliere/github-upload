({
    validateItemForm : function(component) {

        // Simplistic error checking
        var validItem = true;

        var nameField = component.find("name");			// Not blank
        var quantityField = component.find("quantity");	// Not blank, a non-number or 0
        var priceField = component.find("price");		// Not blank a non-number or 0
        
        var name = nameField.get("v.value");
        if ($A.util.isEmpty(name)){
            validItem = false;
            nameField.set("v.errors", [{message:"Name can't be blank."}]);
        }
        else {
            nameField.set("v.errors", null);
        }
        
        var quantity = quantityField.get("v.value");
        if ($A.util.isEmpty(quantity) || isNaN(quantity) || quantity <=0.0){
            validItem = false;
            quantityField.set("v.errors", [{message:"Enter a Quantity"}]);
        }
        else {
            quantityField.set("v.errors", null);
        }
        var price = priceField.get("v.value");
        if ($A.util.isEmpty(price) || isNaN(price) || price <=0.0){
            validItem = false;
            priceField.set("v.errors", [{message:"Enter a Price"}]);
        }
        else {
            priceField.set("v.errors", null);
        }
        
        return validItem;
        
    },
    
    createItem: function(component, item) {
        
        var action = component.get("c.saveItem");
    	action.setParams({"item": item});
    	
        action.setCallback(this, function(response){
            var state = response.getState();
                if (component.isValid() && state === "SUCCESS") {
                    var theItems = component.get("v.items");
                    theItems.push(response.getReturnValue());
                    component.set("v.items", theItems);
                }
    	});
    	$A.enqueueAction(action);
    }
})