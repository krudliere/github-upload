trigger ContactTrigger on Contact (before insert) {
    
    ContactTriggerHandler handler = new ContactTriggerHandler();    
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            handler.transferContact(Trigger.new);
        }
    }
}