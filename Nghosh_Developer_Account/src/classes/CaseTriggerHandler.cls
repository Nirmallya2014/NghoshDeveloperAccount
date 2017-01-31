public with sharing class CaseTriggerHandler {
    
    public Map<String,ID> getEntitlement
    {
        get
        { 
            if(getEntitlement == null)
            {
                getEntitlement = new Map<String,ID>();  
                for(Entitlement e : [Select ID,Name From Entitlement Limit 50000])
                {
                    getEntitlement.Put(e.Name, e.id); 
                }
            }
            return getEntitlement;   
        }
        set;
    }
    
    public void associateProcess(Case c)
    {    
        Contact con = [Select Id, Name From Contact Where Id =: c.ContactId];
        system.debug('Contact Details-'+con);
        system.debug('Entitlement Details-'+getEntitlement.get(con.Name));
        c.EntitlementId = getEntitlement.get(con.Name);
    } 
}