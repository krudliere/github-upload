@isTest
public class CampingListControllerTest {

    public static testMethod void testCampingController() {
        
        Camping_Item__c campingItem = new Camping_Item__c();
        campingItem.Name = 'Axe';
        campingItem.Quantity__c = 1;
        campingItem.Price__c = 10.00;
        campingItem.Packed__c = true;
        
        Camping_Item__c checkItem = CampingListController.saveItem(campingItem);
        System.assertEquals(checkItem.Name, 'Axe');
        
        List<Camping_Item__c> testItems = CampingListController.getItems();
        System.assert(testItems.size()>0);

    }
}