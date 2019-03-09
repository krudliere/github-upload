@isTest
private class AccountTriggerTest {
/*    
    @isTest static void testShippingAddress() {
        
        // test main goal of trigger:
        // ShippingPostalCode automatically set to Billing when Match = true
        Account acc1 = new Account();
        acc1.Name = 'Test Account1';
        acc1.crudg__Match_Billing_Address__c = true;
        
        insert acc1; //testing when billing is null
        
        acc1.BillingPostalCode = '49286';
        //System.assertEquals('49286',acc1.BillingPostalCode);
        
        update acc1; //testing billing populated, on update  
        Account accup = [SELECT Id, ShippingPostalCode from Account WHERE Id = :acc1.Id];
        System.assertEquals('49286', accup.ShippingPostalCode);
        
        // test when not checked
        Account acc2 = new Account();
        acc2.Name = 'Test Account2';
        acc2.BillingPostalCode = '60622';
        acc2.crudg__Match_Billing_Address__c = false;
        insert acc2;
        
    }
    
    static testMethod void nameChangeNotConfirmed(){
    	Profile p = [select id from profile where name='Standard User'];
    
	    User u = new User(alias = 'standt', email='standarduser@testorg.com',
	    emailencodingkey='UTF-8', lastname='Testing', languagelocalekey='en_US',
	    localesidkey='en_US', ProfileId = p.Id, timezonesidkey='America/Los_Angeles', username='standarduser@gmaildevorg.com');
        insert u;
	    
	    Account acc = new Account();
        acc.Name = 'Name1';
        acc.crudg__Confirm_Save__c = false;
        acc.OwnerId = u.Id;
        
        insert acc;
        //acc.Name = 'Name2';
        //update acc;

        System.runAs(u){
			System.debug('Current User: ' + UserInfo.getUserName());
			System.debug('Current Profile: ' + UserInfo.getProfileId());
			
			Test.startTest();
				acc.Name = 'Name2';
				update acc;
			Test.stopTest();
        }

        System.assertEquals(false, acc.crudg__Confirm_Save__c);
        System.assertEquals('Name2',acc.Name);
    }
*/
}