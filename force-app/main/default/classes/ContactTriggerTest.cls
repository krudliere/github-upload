@isTest
public class ContactTriggerTest {
    static testMethod void testTransfer(){
        //Create Contact
        Contact tc = new Contact();
        tc.FirstName = 'Bud';
        tc.LastName = 'Crudder';
        tc.TransferMe__c = true;
        //tc.AccountId = '';
        insert tc;
        
        //build a dupes list and assert it is not empty
        List<Contact> transfers = [select Id, AccountId from Contact where FirstName = 'Bud' AND LastName = 'Crudder'];
        //AccountId = '0016000000IKxTjAAL'];
        System.Assert(transfers[0].AccountId =='0016000000IKxTjAAL');
    }
}