global class BatchApex_TestAsync_Class implements Database.batchable<sObject>, Database.stateful
{
    global AsyncApexJob asyncApexJob;
    
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
        String account_query = 'select id, name from Account';
        
        asyncApexJob = 
          [
              Select Id
                , Status
                , NumberOfErrors
                , JobItemsProcessed
                , TotalJobItems
                , CreatedBy.Email 
               from AsyncApexJob 
               where Id = :BC.getJobId()
          ];
        system.debug('Async Apex Job Details - :'+asyncApexJob);
        
        return Database.getQueryLocator(account_query);
    }
    
    global void execute(Database.BatchableContext BC, List<sObject> scope)
    {
        system.debug('List Of Objects are - '+scope);
    }
    
    global void finish(Database.BatchableContext BC)
    {
        
    }
}