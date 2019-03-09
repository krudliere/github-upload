trigger CaseTrigger on Case (before insert, before update, before delete, after insert, after update, after delete) {
    
    CaseTriggerHandler handler = new CaseTriggerHandler();
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            //FixCreator on Case (before insert)
            handler.fixCreator(Trigger.new);
        }
        else if (Trigger.isUpdate){
            //AddContactToBuildCase on Case(before update)
            handler.addContactToBuildCase(Trigger.new);
        }
    }
}