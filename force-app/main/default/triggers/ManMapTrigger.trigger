trigger ManMapTrigger on Man_Map__c (before insert, before update, before delete, after insert, after update, after delete) {

    ManMapTriggerHandler handler = new ManMapTriggerHandler();
    //reverseMap on Man_Map__c (after insert)
    if(Trigger.isAfter){
        if(Trigger.isInsert){
          handler.reverseManMap(Trigger.new);  
        }
    }

}