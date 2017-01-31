@isTest
private class Test_Extension_Test{
    
    static testMethod void Test_Extension_Test_Method1() {
        
        //String testClassFlag = TestClassFlagSet.CheckExecutionFlag();
        
        if(Label.TestClassFlag != 'False') {
        
            List<Case> cseList = new List<Case>();
            Contact con = new Contact();
            con.FirstName = 'Subha';
            con.lastname = 'Ghosh';
            insert con;
            
            Contact con1 = new Contact();
            con1.FirstName = 'Pallav';
            con1.lastname = 'Ghosh';
            insert con1;
            
            Case cs = new Case();
            cs.Contact = con;
            cs.status = 'New';
            insert cs;
            
            Case cs1 = new Case();
            cs1.Contact = con1;
            cs1.status = 'Working';
            insert cs1;
            
            cseList.add(cs);
            cseList.add(cs1);
            
            system.debug('case list - '+cseList);
            
            ApexPages.StandardController sc = new ApexPages.StandardController(new Case());
            Test_Extension testExt = new Test_Extension(sc);
            Test_Extension testExt1 = new Test_Extension();
            Case cse = new Case();
            Case cse1 = new Case();
            testExt1.caseInfo = cse;
            testExt1.singleCase = cse1;
        }
    }
}