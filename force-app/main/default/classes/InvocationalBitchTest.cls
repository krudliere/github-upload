@isTest
public class InvocationalBitchTest {

    @isTest public static void testInvocationalBitch(){
        Account acc = new Account(Name='Test');
        insert acc;
        
        List<Id> accids = new List<Id>();
        accids.add(acc.Id);
        
        //InvocationalBitch ibt = new InvocationalBitch();
        List<String> gets = InvocationalBitch.getAccountNames(accids);
    }
}