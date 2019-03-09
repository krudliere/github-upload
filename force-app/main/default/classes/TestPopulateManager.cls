@isTest
public class TestPopulateManager {
	
    static testMethod void TestOppManager(){
        
        //create test data
        //get profile id
        Profile p = [SELECT Id FROM Profile WHERE Name='Standard User'];
        
        //create user manager
        User mgr = new User(Alias = 'mgr', Email='mgr@testorg.com', 
                            EmailEncodingKey='UTF-8', LastName='mgr', LanguageLocaleKey='en_US', 
                            LocaleSidKey='en_US', ProfileId = p.Id, 
                            TimeZoneSidKey='America/Los_Angeles', UserName='mgr@testorg.com');
        insert mgr;        
        
        // create opp owner
        User owner = new User(Alias = 'owner', Email='owner@testorg.com', 
                            EmailEncodingKey='UTF-8', LastName='owner', LanguageLocaleKey='en_US', 
                            LocaleSidKey='en_US', ProfileId = p.Id, ManagerId = mgr.Id,
                            TimeZoneSidKey='America/Los_Angeles', UserName='owner@testorg.com');
        insert owner; 
        
        //create Opp
        Opportunity o = new Opportunity();
        o.Name = 'Test Opp';
        o.StageName = 'Open';
        o.CloseDate = Date.today();
        o.OwnerId = owner.Id;
        insert o;
        
        //see what the mgr id is for the new opp
        List<Opportunity> testopps = [select OwnerId, Owners_Manager__c from Opportunity Where Name = :o.Name];
        o.Owners_Manager__c = testopps[0].Owners_Manager__c;

        System.AssertEquals(mgr.Id, o.Owners_Manager__c);

        
    }
}