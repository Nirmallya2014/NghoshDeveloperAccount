public class Fridge{
public String modelNumber;
public Integer numberInStock;

//Declaring Constructor
//Code added to check deployment
public Fridge(String modelNumberPara,Integer numberInStockPara){
modelNumber=modelNumberPara;
numberInStock=numberInStockPara;
}
public void updateStock(Integer justSold){
numberInStock=numberInStock-justSold;
}
public Integer ecoRating{
        get{return ecoRating;}
        set{ecoRating=value;if(ecoRating<0) ecoRating=0; }
    }
public void doMore(){
    String myName='Pencils';    
    Merchandise__c[] ms=[SELECT Id,Description__c,Price__c,Total_Inventory__c FROM Merchandise__C WHERE Name=:myName];
    for(Merchandise__c temp:ms){
        System.debug('Id is > '+temp.Id+' Description is > '+temp.Description__c+' Price > '+temp.Price__c+' Total Inventory > '+temp.Total_Inventory__c);
        List<List<SObject>> searchList=[FIND 'Pencil*' IN ALL FIELDS RETURNING Merchandise__c(Id,Name),Invoice_Statement__c];
        Merchandise__c[] merList=(List<Merchandise__c>)searchList[0];
        Invoice_Statement__c[] invList=(List<Invoice_Statement__c>)searchList[1];
        System.debug('Found '+merList.size()+' Merchandise Item.');
        System.debug('Found '+invList.size()+' Invoice Statement');
        //Comment
    } 
}
  public static void addInvoice(String invoiceDesc,String status){
        Invoice_Statement__c inv=new Invoice_Statement__c(Description__c=invoiceDesc,Status__c=status);
		insert inv;        
    }
    public static void updateInvoice(String invoiceDesc,String status){
        
        Invoice_Statement__c inv=[SELECT Status__c FROM Invoice_Statement__c WHERE Description__c=:invoiceDesc];
        //inv.Description__c=invoiceDesc;
        inv.Status__c=status;
        update inv;
    } 

    public static void deleteInvoice(String invoiceDesc){
      Invoice_Statement__c inv=[SELECT Status__c FROM Invoice_Statement__c WHERE Description__c=:invoiceDesc];
        delete inv;
   }
    public static void unDeleteInvoice(String invoiceDesc){
         Invoice_Statement__c inv=[SELECT Status__c FROM Invoice_Statement__c WHERE Description__c=:invoiceDesc ALL ROWS];
        undelete inv;
    }
}