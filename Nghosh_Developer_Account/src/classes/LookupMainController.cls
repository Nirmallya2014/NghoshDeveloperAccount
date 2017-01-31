//
// Custom controller for lookup example main page
//
public with sharing class LookupMainController 
{
	public String accountName {get; set;}
	public Id accountId {get; set;}
	public List<Contact> contacts {get;set;}
	public List<Contact> contacts_result {get;set;}
    
	public PageReference findContacts()
	{
		if (null!=accountId)
		{
            System.debug('accountId'+accountId);
		   contacts_result=[select id,FirstName, LastName from Contact where Account.Id=:accountId];
		}
		
		return null;
	}
}