public class CaseTriggerHandler {

    public void fixCreator(List<Case> c){
        //TEST: Test Data: User with same email as Supplied Email (see below)
        
        // Step 1: Create a set of all emails of Users to query
        Set<String> allEmails = new Set<String>();
        for (Case newCase : c) {
            if (newCase.SuppliedEmail != null) {
                allEmails.add(newCase.SuppliedEmail);
            }
        }
        
        //TEST: No Supplied Email on case creation
        //TEST: Supplied Email provided, ASSERT allMails.size > 0
        
        // Step 2: Query for all the Users in Step 1
        List<User> potentialUsers = [SELECT Id, Email FROM User
                                     WHERE Email IN :allEmails];
        //TEST: Assert potentialUsers > 0
        
        // Step 3: Make a Map that lets you search for Users by Email
        Map<String, User> emailToUserMap = new Map<String, User>();
        for (User u : potentialUsers) {
            emailToUserMap.put(u.Email, u);
        }
        
        //TEST: Assert emailToUserMap.size() > 0
        
        // Step 4: Get the matching user in the Map by Email!
        for (Case newCase : c) {
            if (newCase.SuppliedEmail != null) {
                User creator = emailToUserMap.get(newCase.SuppliedEmail);
                if (creator != null) {
                    newCase.User__c = creator.Id;
                }
            }
        }
        
        //TEST: Assert SuppliedEmail == User__c.Email
    }
    
    public void addContactToBuildCase(List<Case> c){
        List<Case> cases = new List<Case>();
        Contact cn = [Select ID, Name from Contact where ID = '0036000000qhelW'];
        for(Case nc : c) {
            if (nc.Contact == NULL && nc.Type == 'Mechanical') {
                nc.ContactId = cn.Id;
            }
        }
    }
}