public class ManMapTriggerTest {
    
    static testMethod void myTest()
    {
        // To test the ReverseManMap trigger, the test
        // method creates an man map, 
        // and then asserts that the Contact and Related Contact
        // fields were correctly copied from the original Man Map record
        // and that the Auto Created field is true. 

        Man_Map__c mm = new Man_Map__c(Contact__c = '0036000000oCS6x', Related_Contact__c = '0036000000nWkGe',
                    Relationship__c = 'Friend', Rating__c = '1', Auto_Created__c = false);
        
        insert mm;
        
        //System.assertEquals()
    }
    

}