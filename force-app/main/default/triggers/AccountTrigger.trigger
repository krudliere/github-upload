trigger AccountTrigger on Account (before insert, before update, before delete, after insert, after update, after delete) {
/*
    AccountTriggerHandler handler = new AccountTriggerHandler();
    
    //populateShipping on Account (before insert, before update)    
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            handler.populateShipping(Trigger.new);
        }
        if(Trigger.isUpdate){
            handler.populateShipping(Trigger.new);
            handler.confirmSave(Trigger.new, Trigger.old); 
        }        
    }
*/}