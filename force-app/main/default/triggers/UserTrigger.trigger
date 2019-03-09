trigger UserTrigger on User (before insert) {
    
    UserTriggerHandler handler = new UserTriggerHandler();
    if(Trigger.isBefore){
        handler.forceForecasting(Trigger.new);
    }
}