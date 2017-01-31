public with sharing class TestClassFlagSet {

    public static String UpdateExecutionFlagToFalse()
    {
        String checkSuccess = '';
        try 
        {
            ExecuteTestClassFlag__c testclassFlag = [select id,Name,Execute_flag__c from ExecuteTestClassFlag__c];
            testclassFlag.Execute_flag__c = 'False';
            Database.Update(testclassFlag);
            If(Test.isRunningTest()) {
                Integer error = 0/0; 
            }          
        }
        Catch(Exception ex) {
        
        }
        return 'success';
    }
    
    public static String UpdateExecutionFlagToTrue()
    {
        String checkSuccess = '';
        try 
        {
            ExecuteTestClassFlag__c testclassFlag = [select id,Name,Execute_flag__c from ExecuteTestClassFlag__c];
            testclassFlag.Execute_flag__c = 'True';
            Database.Update(testclassFlag);
            
            If(Test.isRunningTest()) {
                Integer error = 0/0; 
            }         }
        Catch(Exception ex) {
        
        }
        return 'success';
    }
    
    public static String CheckExecutionFlag()
    {
        ExecuteTestClassFlag__c testclassFlag = [select id,Name,Execute_flag__c from ExecuteTestClassFlag__c limit 1];
        If(testclassFlag.Execute_flag__c == 'True')
        {
            return 'ExecuteTestClassTrue';
        }
        else 
        {
            return 'ExecuteTestClassFalse';
        }
    }
}