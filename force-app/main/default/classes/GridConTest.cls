@isTest
private class GridConTest {
	
	@isTest static void testGridCon() {
		// Implement test code
        
        //insert Contact
        Contact c = new Contact(FirstName = 'Bud', LastName = 'Crudder');
        insert c;

        //insert CR
        CR__c cr = new CR__c(Contact__c = c.Id,Contact_Role__c = '4');
        insert cr;
        
        //instatiate controller instance
        GridCon gc = new GridCon();
        
        // invoke methods
        gc.reset();
        
        List<CR__c> crs = gc.getCRs();
        gc.setCrs(crs); 
        
        gc.save(); 
        gc.add(); 
	}
	
	
}