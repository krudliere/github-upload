({
    loadTasks : function(component) {
        var dt = new Date();
        var demoItems = [{Subject: 'Task1', ActivityDate: dt.toDateString()},
                         {Subject: 'Task2', ActivityDate: dt.toDateString()},
                         {Subject: 'Task3', ActivityDate: dt.toDateString()}];
        component.set("v.tasks", demoItems);
    },
    
    addTask : function(component) {
        var items = component.get("v.tasks");
        var newItem = {Subject: component.get("v.newTask.Subject"), ActivityDate: new Date(component.get("v.newTask.ActivityDate")).toDateString()}
        items.push(newItem)
        component.set("v.tasks", items);
        component.set("v.newTask", {'sobjectType': 'Task','Subject': '','ActivityDate': ''});
    }
})