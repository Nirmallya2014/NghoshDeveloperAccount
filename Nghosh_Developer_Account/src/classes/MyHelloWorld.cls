public class MyHelloWorld{
public static void applyDiscount(Book__c[] books){
for(Book__c b:books){
b.Price__c*=0.9;
system.debug('Hello World@@@@@@@@27th April');
}
}
}