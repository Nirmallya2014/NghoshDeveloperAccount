public class Case_ShowRelatedContacts{
    public Case cse{get;set;}
    public List<Contact> lstContact {get;set;}
    public Case_ShowRelatedContacts(ApexPages.StandardController stdController){
        this.cse = (Case)stdCOntroller.getRecord();
        lstContact = new List<Contact>();
        lstContact = [Select Firstname,lastname from Contact Limit 10];
    }
     
}