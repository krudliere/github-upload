public class GridCon {
                        
    List<CR__c> crs;    // list of CRs to appear in the multi-line
    
    public PageReference reset() {
        crs = [Select c.Name, c.Contact__c, c.Contact_Role__c From CR__c c];
        return null;
    }
    
    public List<CR__c> getCrs() {
        if(crs == null)  reset();
        return crs;
    }

    public void setCrs(List<CR__c> crList) {
        crs = crList;
    }
    public PageReference save() {
        upsert crs;
        return null;
    }
    public PageReference add() {
        crs.add(New CR__c());
        return null;
    }
}