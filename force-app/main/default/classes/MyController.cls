public class MyController {

    public Account account;

	public PageReference save() {
        update account;
        PageReference secondPage = Page.NavigateTo;
        secondPage.setRedirect(true);
        secondPage.getParameters().put('id',account.id); 
        return secondPage;     }

    public String getName() {
        return 'MyController';
    }

    public Account getAccount() {
        if(account == null)
        account = [select id, name, type, IsPersonAccount from Account 
                 where id = :System.currentPageReference().getParameters().get('id')]; 
        return account;
    } 
}