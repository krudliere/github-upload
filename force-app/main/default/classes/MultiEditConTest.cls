@isTest
public class MultiEditConTest {

        @isTest public static void testMultiEditCon(){
        
        	//insert account
        	Account a = new Account(Name = 'Test Account', Type = 'Customer - Direct', 
                                    BillingCity = 'Chicago', SLAExpirationDate__c = System.today() );
        	insert a;
            
            //instatiate controller instance
            MultiEditCon mec = new MultiEditCon();
            
            // invoke methods
            mec.reset();
            List<Account> accs = mec.getAccounts();
            mec.setAccounts(accs); 
            
            //mec.accountList.add(a);
            mec.save(); 
            mec.add(); 
            
    }
}