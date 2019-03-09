trigger LeadTrigger on Lead (before insert) {

    LeadTriggerHandler handler = new LeadTriggerHandler();
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            handler.findDupes(Trigger.new);
        }
        else if(Trigger.isUpdate){
            handler.farewellToLead(Trigger.new, Trigger.OldMap);
        }
    
	}
}