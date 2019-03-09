public class ContactTriggerHandler {

    //Account to Transfer Contact(s) to: 0016000000IKxTjAAL
    public void transferContact(List<Contact> cn){
        for (Contact c : cn) {
            if (c.TransferMe__c) {
                c.AccountId = '00160050000IKxTjAAL';
            }
        }
    }
}