({
    doInit : function(component, event, helper) {
        helper.loadTasks(component);
    },
    
    addTask : function(component, event, helper) {
        helper.addTask(component);
    }
})