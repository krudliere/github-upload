@isTest
public class DataListConTest {

    @isTest public static void testDataListCon(){
        
        	//insert account
        	Account a = new Account(Name = 'Test Account', Type = 'Customer - Direct', 
                                    BillingCity = 'Chicago', SLAExpirationDate__c = System.today() );
        	insert a;
            
            //instatiate controller instance
            DataListCon dlc = new DataListCon();
            
            // invoke methods
            dlc.reset();
            List<Account> accs = dlc.getAccounts();
            dlc.setAccounts(accs); 
            
            //dlc.accountList.add(a);
            dlc.save(); 
            dlc.add();
    }
}