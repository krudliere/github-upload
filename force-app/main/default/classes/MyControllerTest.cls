@isTest
private class MyControllerTest {
	
	@isTest static void testMyController() {
		// Implement test code // 
        Account acc = new Account(FirstName='test1',LastName='test2');
        insert acc;
        
        ApexPages.currentPage().getParameters().put('Id',acc.id);
        MyController controller = new MyController();
        
        Account retAcc = controller.getAccount();
        controller.account = acc;
        PageReference retPref =  controller.save();
        String s = controller.getName();
	}
	
}