Public with sharing class SOSLController{
 Public List<Opportunity> optyList {get;set;}
 Public List<contact> conList{get;set;}
 Public List<account> accList{get;set;}
  
 Public String searchStr{get;set;}
   Public SOSLController(){
   }
  
  Public void soslDemo_method(){
   optyList = New List<Opportunity>();
   conList = New List<contact>();
   accList = New List<account>();
   if(searchStr.length() > 1){
   String searchStr1 = '*'+searchStr+'*';
   String searchQuery = 'FIND \'' + searchStr1 + '\' IN ALL FIELDS RETURNING  Account (Id,Name,type),Contact(name,email),Opportunity(name,StageName)';
   List<List <sObject>> searchList = search.query(searchQuery);
   accList = ((List<Account>)searchList[0]);
   conList  = ((List<contact>)searchList[1]);
   optyList = ((List<Opportunity>)searchList[2]);
   if(accList.size() == 0 && conList.size() == 0 && optyList.size() == 0){
       apexPages.addmessage(new apexpages.message(apexpages.severity.Error, 'Sory, no results returned with matching string..'));
       return;
   }
   }
   else{
   apexPages.addmessage(new apexpages.message(apexpages.severity.Error, 'Please enter at least two characters..'));
   return;
   }
  }
}