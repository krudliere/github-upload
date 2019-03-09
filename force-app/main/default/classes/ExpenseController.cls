public class ExpenseController {
   
    //Action method to return the expense list called from client side JavaScript controller
    @AuraEnabled
    public static List<Expense__c> getExpenses() {

        return [SELECT id
                    ,name
                    ,Amount__c
                    ,Client__c
                    ,Date__c
                    ,Reimbursed__c
                    ,Approved__c 
                FROM 
                    Expense__c 
                ORDER BY 
                    createdDate ASC
               ];
    }    

    //Save method called from client side JavaScript controller
    @AuraEnabled
    public static Expense__c saveExpense(Expense__c expense) {
        upsert expense;
        return expense;
    }
   
}