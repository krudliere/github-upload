@isTest
public class TestFindDupes {
    static testMethod void testDupes(){
        
        //create Contact
        Contact c = new Contact();
        c.FirstName = 'Larry';
        c.LastName = 'Bird';
        c.Email = 'larry@celtics.com';
        insert c;
        
        //create a dupe Lead
        Lead l = new Lead();
        l.FirstName = 'Larry';
        l.LastName = 'Nelson';
        l.Email = 'larry@celtics.com';
        
        try {
            insert l;
        }
        catch (Exception e){
            System.debug('an error was thrown as expected');
        }
        
        //build a dupes list and assert it is empty
        List<Lead> dupes = [select id from Lead where Email = 'larry@celtics.com'];
        System.AssertEquals(0,dupes.size());
        
        //insert non-dupe to make sure trigger doesn't always get thrown
        Lead nonDupe = new Lead();
        nonDupe.FirstName = 'Chad';
        nonDupe.LastName = 'Bradley';
        nonDupe.Email = 'chad@brad.com';
        insert nonDupe;
        
        //build the nonDupes List and make sure it is > 0
        List<Lead> nonDupes = [select Id from Lead where Email = 'chad@brad.com'];
        System.AssertEquals(1,nonDupes.size());
        
        
    }
}