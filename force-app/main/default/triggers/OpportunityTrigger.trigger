trigger OpportunityTrigger on Opportunity (before insert, before update, before delete, after insert, after update, after delete) {

    OpportunityTriggerHandler handler = new OpportunityTriggerHandler();
    
    if(Trigger.isBefore){
       handler.populateManager(Trigger.new);
    }
    
    if (Trigger.isAfter){
        handler.followupTaskOnClose(Trigger.new);
    }
}