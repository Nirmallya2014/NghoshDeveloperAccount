global with sharing class UpdateCaseInteractionField{

    @InvocableMethod
    public static void updateNoReplyFlag(List<Id> case_id) {
        List<Case_Interaction__c> updatedInteraction = new List<Case_Interaction__c>();
        List<Case_Interaction__c> cseInt = [select id, Case__c, No_Reply_Required__c, LastModifiedDate from Case_Interaction__c where Case__r.Id =: case_id[0]  ORDER BY LastModifiedDate DESC limit 1];
        For(Case_Interaction__c cint: cseInt) {
            cint.No_Reply_Required__c = True;
            updatedInteraction.add(cint);
        }
        Update updatedInteraction;
        system.debug('@CaseInteraction@'+cseInt);
    }
}