global with sharing class TestSecurityScanner{
    public string fname{get; set;}
    public string lname{get; set;}
    public void getAllDetails() {
        Id urlParam = Id.valueOf(ApexPages.CurrentPage().getParameters().get('LastName'));
        Contact cnt = Database.Query('select Id, FirstName, LastName From Contact Where LastName = \'' + urlParam +'\' ');
        if(cnt != null) {
            fname = cnt.FirstName;
            lname = cnt.LastName;
        }
    }   
}