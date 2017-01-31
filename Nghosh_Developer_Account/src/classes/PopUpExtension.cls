public class PopUpExtension{
    public Account account{get;set;}
 
    public PopUpExtension(ApexPages.StandardController stdController){
        this.account = (Account)stdCOntroller.getRecord();
    }
     
}