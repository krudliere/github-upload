@isTest
public class testAddContactToBuildCase {

    static testMethod void updateContactToBuildCase(){
        
        Case c = new Case(Subject = 'Test1', Type = 'Mechanical');
        insert c;

        c.Subject = 'Update1';
        update c;
        
        System.assert(c.ContactId == '0036000000qhelW');
       
    }
}