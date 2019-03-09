@isTest 
public class UserTriggerTest {
    static testMethod void insertNewUser() {
       
       User userToCreate = new User();
       
       // Do you recognize these fields?
       userToCreate.FirstName = 'Constance';
       userToCreate.LastName  = 'Goodbottom';
       userToCreate.Email     = 'mcrudder@yahoo.com';
       userToCreate.Username  = 'goodbottom@gmail.com';
       userToCreate.Alias     = 'fatty';
       userToCreate.ProfileId = '00e30000000hfEx';

       // Don't worry about these
       userToCreate.TimeZoneSidKey    = 'America/Chicago';
       userToCreate.LocaleSidKey      = 'en_US';
       userToCreate.EmailEncodingKey  = 'UTF-8';
       userToCreate.LanguageLocaleKey = 'en_US';
       
       insert userToCreate;
    }
}