@isTest
public class MyConsoleControllerTest {

    public static testMethod void testMyConsoleController(){
    	
        //insert user
        Profile p = [SELECT Id FROM Profile WHERE Name='Standard User']; 
        User u = new User(Alias = 'standt', Email='console@testorg.com', 
            EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
            LocaleSidKey='en_US', ProfileId = p.Id, 
            TimeZoneSidKey='America/Chicago', UserName='console@testorg.com');
        insert u;
        
        //insert case
        Case k = new Case(Subject = 'Test', Priority = 'Medium', Status = 'Open', OwnerId = u.Id);
        insert k;
        
        //insert solution
        Solution s = new Solution(SolutionName = 'Test', Status = 'Reviewed');
        insert s;
        
        MyConsoleController mcc = new MyConsoleController();
        
        //Solution[] getSolutions()
        List<Solution> sols = mcc.getSolutions();
        
        //PageReference viewCase()
        ApexPages.currentPage().getParameters().put('caseId',k.id);
        PageReference casePageRef = mcc.viewCase();
        
    	//PageReference viewSolution()
        ApexPages.currentPage().getParameters().put('solId',s.id);
        PageReference solPageRef = mcc.viewSolution();

        //Case[] getMyCases()(runas(u))
        System.runAs(u){
        	List<Case> ks = mcc.getMyCases();           
        }
    	

        
    }
}