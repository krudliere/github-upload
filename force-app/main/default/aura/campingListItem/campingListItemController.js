({
    clickPacked: function(component, event, helper) {
        var item = component.get("v.item");
        var updateItem = component.getEvent("updateItem");
        updateItem.setParams({ "item": item });
        updateItem.fire();
    }
})