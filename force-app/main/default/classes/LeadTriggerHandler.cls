public class LeadTriggerHandler {

    public void findDupes(List<Lead> l){
        for (Lead myLead : l) {
            if (myLead.Email != NULL){
                List<Contact> dupes = [select id from Contact where Email = :myLead.Email];
                if (dupes.size() > 0){
                    String errorMessage = 'Duplicate(s) found!';
                    errorMessage += 'RecordId is: ' + dupes[0].Id;
                    MyLead.addError(errorMessage);
                    
                }
            }
    	}
    }
    
    public void farewellToLead(List<Lead> nl, Map<Id,Lead> olm){
        /*
        - Sends a “Farewell” email to Leads
        - Only sends this email when the Lead’s “Rating” changes to “Cold”
        - Can be turned on and off without writing any code
        - Has at least five System.debug statements
        - Don’t forget the test class!
    	*/
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        
        // Grab your Custom Setting values
        Farewell_Settings__c settings = Farewell_Settings__c.getInstance('FarewellOnOff');
        Boolean go = settings.Farewell__c;
        
        if (go){ //add custom setting check here after it is set up
            for (Lead l : nl) {
                Lead oldLead = olm.get(l.Id);
                if (l.Rating == 'Cold' && oldLead.Rating != 'Cold'){
                    System.debug(true);
                    
                    // Step 1: Create a new Email
                    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                    
                    // Step 2: Set list of people who should get the email
                    List<String> sendTo = new List<String>();
                    sendTo.add(l.Email);
                    mail.setToAddresses(sendTo);
                    System.debug('sendTo');
                    
                    // Step 3: Set who the email is sent from
                    mail.setReplyTo('mikhail@krudliere.com');
                    mail.setSenderDisplayName('Krudliere');
                    
                    // Step 4: Populate email body
                    mail.setSubject('URGENT BUSINESS PROPOSAL');
                    String body = 'Dear ' + l.FirstName + ', ';
                    body += 'This is text';
                    mail.setHtmlBody(body);
        
                    // Step 5. Add your email to the master list
                    mails.add(mail);
                    System.debug(mails.size());
                }
            }
            Messaging.sendEmail(mails);
        }
    }
}