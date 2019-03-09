public class ManMapTriggerHandler {

    //For each Man Map processed by the trigger, add a new
    //Man Map record that reverses the Contact and Related Contact 
    //on the current Map Map record.
    //Note that Trigger.New is a list of all the new Man Maps
    //that are being created...
    
    public void reverseManMap(List<Man_Map__c> mm){
        List<Man_Map__c> manMaps = new List<Man_Map__c>();
        
        for (Man_Map__c newManMap: mm) {
            if (newManMap.Auto_Created__c != true) {
                manMaps.add(new Man_Map__c(
                    Contact__c = newManMap.Related_Contact__c, 
                    Related_Contact__c = newManMap.Contact__c,
                    Relationship__c = newManMap.Relationship__c, 
                    Rating__c = newManMap.Rating__c, 
                    Auto_Created__c = true
                ));
            }
        }        
        insert manMaps;
    }
}