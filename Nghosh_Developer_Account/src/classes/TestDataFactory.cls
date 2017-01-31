//@isTest
public class TestDataFactory {
public static Invoice_Statement__c createOneInvoiceStatement(
Boolean withLineItem) {
// Create one invoice statement
Invoice_Statement__c testInvoice = createInvoiceStatement();
if (withLineItem == true) {
// Create a merchandise item
Merchandise__c m = createMerchandiseItem('Orange juice');
// Create one line item and associate it with the invoice statement.
// AddLineItem(testInvoice, m);
}
return testInvoice;
}
// Helper methods
//
private static Merchandise__c createMerchandiseItem(String merchName) {
Merchandise__c m = new Merchandise__c(
Name=merchName,
Description__c='Fresh juice',
Price__c=2,
Total_Inventory__c=1000);
insert m;
return m;
}
private static Invoice_Statement__c createInvoiceStatement() {
Invoice_Statement__c inv = new Invoice_Statement__c(
Description__c='Test Invoice');
insert inv;
return inv;
}
private static Line_Item__c AddLineItem(Invoice_Statement__c inv,
Merchandise__c m) {
Line_Item__c lineItem = new Line_Item__c(
Invoice_Statement__c = inv.Id,
Merchandise__c = m.Id,
Unit_Price__c = m.Price__c,
Units_Sold__c = (Double)(10*Math.random()+1));
insert lineItem;
return lineItem;
}
public static void doExample(){
        System.debug('This is Example.');
        List<String> lst=new List<String>();
        lst.add('A');
        lst.add('B');
        lst.add('C');
        for(Integer i=0;i<lst.size();i++){
            System.debug('List elements >'+lst[i]);
        }
   /* for(String a:lst){
        System.debug('List elements >'+a);
    }*/
    System.debug('This is Test...>>');
    }
    public static void testDemo(){
        System.debug('Executing Teste Cases.......');
        List<String> arrayList1=new List<String>();
       // System.debug('List elements are >'+arrayList1[0]);
        arrayList1.add('ABC');
        arrayList1.add('DEF');
        arrayList1.add('GHI');
        for(Integer i=0;i<arrayList1.size();i++){System.debug('Elements>'+arrayList1[i]);}
    }
}