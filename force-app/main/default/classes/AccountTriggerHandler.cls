public class AccountTriggerHandler {
/*
    public void populateShipping(List<Account> acc){
        for(Account a : acc)
        {
            
            if(a.crudg__Match_Billing_Address__c == true && a.BillingPostalCode != null){
                a.ShippingPostalCode = a.BillingPostalCode;
            }    
            
        }
    }
    
    public void confirmSave(List<Account> nt, List<Account> ot){
        String AccountName= ot[0].Name;
        Profile p = [SELECT Name FROM Profile WHERE Id = :Userinfo.getProfileId()];
        if(p.Name != 'System Administrator')
        {
            for (Account a : nt)
            {
                if (a.Confirm_Save__c == false && a.Name <> AccountName)
                {
                    a.addError('Changing the name of an SFDC Account will also change the name of the Oracle Customer and could break linkage to current and future POS data. Do you want to change the name of this Account? If so, please check the Confirm Save checkbox.');
                }
                a.Confirm_Save__c=false;
                a.Account_Name_Delta__c=AccountName;
            }
        }  
    }
*/
}