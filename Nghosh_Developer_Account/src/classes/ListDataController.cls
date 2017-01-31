public with sharing class ListDataController{
public List<Account> Accounts{get;set;}
public ListDataController(){
Accounts=[select id from Account limit 10];
}
}