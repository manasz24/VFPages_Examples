public class MyController {

    Account account;

    public PageReference save() {
        update account;
        PageReference secondPage = Page.mySecondPage2;
        secondPage.setRedirect(true);
        secondPage.getParameters().put('id',account.id); 
        return secondPage; 
    }

    public String getName() {
        return 'MyController';
    }

    public Account getAccount() {
        try{
            account = [select id, name, site from Account 
                       where id = :ApexPages.currentPage().getParameters().get('id')];
        return account;
    }
    catch(exception ee){
        System.debug('The following exception has occurred: ' + ee.getMessage());
        //ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error, 'Second Error Message added from apex'));
        return null;
    }

        
    } 
}