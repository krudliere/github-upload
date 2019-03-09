({
    getItems: function(component) {
        var action = component.get("c.getItems");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS") {
                component.set("v.items", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    
    updateItem : function(component, expense, callback) {
        var action = component.get("c.saveItem");
        action.setParams({ "item": item });
        if (callback) {
            action.setCallback(this, callback);
        }
        $A.enqueueAction(action);
    }
})