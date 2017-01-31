public class ShowAllAccountClass {
    public List<Account> Acc {get; set;}
	public ShowAllAccountClass(){
    	Acc = [Select Id, Name, AccountNumber,Phone,BillingStreet from Account limit 1000];
 	}
}