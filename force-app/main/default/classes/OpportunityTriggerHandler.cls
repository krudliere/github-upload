public class OpportunityTriggerHandler {

    public void populateManager(List<Opportunity> opp){
        // 1. Get all the owners [SET of Users]
        Set<Id> owners = new Set<Id>();
        for (Opportunity o : opp) {
            owners.add(o.OwnerId);
        }
        
        // 2. Get the Manager from the Users that are owners [LIST of Users in SET of #1]
        List<User> users = [SELECT Id, ManagerId FROM User WHERE Id in :owners];
        
        // 3. Make a map that lets us search for Managers by Owner
        Map<Id, Id> ownerToManagerMap = new Map<Id, Id>(); 
        for (User u : users){
            ownerToManagerMap.put(u.Id, u.ManagerId);
        }
        
        // 4. Get the matching manager User in the Map by OwnerId!
        for (Opportunity o : opp){
            Id manager = ownerToManagerMap.get(o.OwnerId);
            o.Owners_Manager__c = manager;
        }
    }
    
    public void followupTaskOnClose(List<Opportunity> opp){
        List<Id> oppIds = new List<Id>();
        List<Task> tasks = new List<Task>();
        for (Opportunity o : opp){
            if (o.StageName == 'Closed Won'){
                oppIds.add(o.Id);
            }
        }
        for (Id i : oppIds){
            Task t = new Task();
            t.WhatId = i;
            t.Subject = 'Follow Up Test Task';
            tasks.add(t);
        }
        insert tasks;
    }
}