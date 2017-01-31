trigger CaseTrigger on Case (before insert, before update, after insert, after update) {
    
    if(trigger.isInsert && trigger.isBefore) {
        CaseTriggerHandler caseHnd = new CaseTriggerHandler();
        for(Case cse:trigger.new) {
            system.debug('Conatct Is-'+cse.ContactId);
            caseHnd.associateProcess(cse);
        }
    }
    
    if(trigger.isInsert && trigger.isAfter) {
        
    }
    
    if(trigger.isUpdate && trigger.isBefore) {
        CaseTriggerHandler caseHnd = new CaseTriggerHandler();
        for(Case cse:trigger.new) {
            system.debug('Conatct Is-'+cse.ContactId);
            caseHnd.associateProcess(cse);
        }
    }
    
    if(trigger.isUpdate && trigger.isAfter) {
        
    }
}