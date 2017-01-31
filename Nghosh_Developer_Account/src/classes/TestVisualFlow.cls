public class TestVisualFlow {

    public string account_id {get; set;}
    
    public TestVisualFlow() 
    {
         account_id = ApexPages.currentPage().getParameters().get('account_id');       
    }
}