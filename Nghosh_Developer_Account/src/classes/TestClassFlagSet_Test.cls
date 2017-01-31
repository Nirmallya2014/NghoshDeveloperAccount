@isTest
public with sharing class TestClassFlagSet_Test {

    static testMethod void TestClassFlagSet_Test_Method1() {
    
        ExecuteTestClassFlag__c testCust = new ExecuteTestClassFlag__c();
        testCust.Execute_flag__c = 'False';
        testCust.Name = 'Execute_Test_class';
        insert testCust;   
        
        TestClassFlagSet.UpdateExecutionFlagToFalse();
        TestClassFlagSet.CheckExecutionFlag();        
        TestClassFlagSet.UpdateExecutionFlagToTrue();
        TestClassFlagSet.CheckExecutionFlag();
        
    }
}