public with sharing class Test_Extension{
    
    public Case caseInfo{get;set;}
    public List<Case> WorkingCaseList {get; set;}
    public List<Case> NewCaseList {get; set;}
    public List<Case> caseList {get; set;}
    public Case singleCase {get;set;}
    
    
    public Test_Extension() 
    {
        
    }
    
    public Test_Extension(ApexPages.StandardController stdController) 
    {
        
        system.debug('Apex Stdcontroller:'+stdController);
        
        String urlCaseStatus = ApexPages.currentPage().getParameters().get('status');
        caseList = [select id, CaseNumber, Contact.Name, Status, Priority from Case where status != 'Closed' limit 100];
        system.debug('-----@@@'+caseList.size());
        system.debug('-----@@@'+caseList.size());
        For(Case csen : caseList)
        {
            
            if(csen.Status == 'Working')
            {
                system.debug('-----Working Case Size ----@ --'+caseList.size());
                System.debug('Working Case Info - '+csen);
                //WorkingCaseList.add(csen);
            }
            else if(csen.status == 'New')
            {
                System.debug('Working Case Info - '+csen);
                //NewCaseList.add(csen);
            }
        }
    }
    
    
}