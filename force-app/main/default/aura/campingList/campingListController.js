({
    // Load items from Salesforce
    doInit: function(component, event, helper) {     
        // Create the action
        helper.getItems(component);

    },
    
    handleUpdateItem: function(component, evt, helper) {
      var item = component.get("v.item");
      // Note that updateItem matches the name attribute in <aura:registerEvent>
      var updateItem = component.getEvent("updateItem");
      updateItem.setParams({ "item": item }).fire();
    }
}


})