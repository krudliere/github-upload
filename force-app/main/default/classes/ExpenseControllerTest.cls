@isTest
public class ExpenseControllerTest {
	
    testmethod static void testExpenseController(){
    	
        Expense__c x = new Expense__c();
        x.Name='Test Expense';
        x.Amount__c=100.00;
        x.Client__c='BoogaBooga';
        x.Date__c=System.today();
        x.Reimbursed__c = false;
        
        ExpenseController.saveExpense(x);
        
        List<Expense__c> ex = ExpenseController.getExpenses();
	}
}