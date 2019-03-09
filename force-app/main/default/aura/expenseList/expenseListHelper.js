({
    //Fetch the expenses from the Apex controller
    getExpenseList: function(component) {

        console.log("expenseListHelper.getExpenseList: entered");

        var action = component.get("c.getExpenses");

        //Set up the callback
        var self = this;
        action.setCallback(this, function(actionResult) {

            //Reset the value of the component list attribute with the records returned 
            component.set("v.expenses", actionResult.getReturnValue());
            
        });

        //Enque the action
        $A.enqueueAction(action);

        console.log("expenseListHelper.getExpenseList: exit");

    },   
})