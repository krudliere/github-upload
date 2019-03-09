({
    //Initialize the view and fetch the list of expenses on load
    doInit : function(component, event, helper) {
       
        console.log("expenseListController.doInit: entered");

        helper.getExpenseList(component);

        console.log("expenseListController.doInit: exit");
    },
    
})