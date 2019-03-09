/*** Controller: ***/
                        
public class dataListCon {

    public PageReference reset() {
      return null;
    }                       
	List<Account> accounts;	
	public List<Account> getAccounts() {
		if(accounts == null) accounts = [select type, id, name from account];
		return accounts;
	}
	public void setAccounts(List<Account> accountList) {
		accounts = accountList;
	}
	public PageReference save() {
	    upsert accounts;
	    return null;
	}
	public PageReference add() {
	        accounts.add(New Account());
	        return null;
	}
}