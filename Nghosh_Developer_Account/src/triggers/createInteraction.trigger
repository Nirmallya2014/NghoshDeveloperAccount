trigger createInteraction on Case (after insert, after update) {

    List<Case> cseList = trigger.new;
    Interaction__c intrct = new Interaction__c();
    intrct.Name = 'Case Updated';
    intrct.CaseIds__c = cseList[0].Id;
    insert intrct;
     

    Case_Interaction__c cseintrct = new Case_Interaction__c();
    cseintrct.Case__c = cseList[0].Id;
    cseintrct.Interactions__c = intrct.Id;
    insert cseintrct; 
}