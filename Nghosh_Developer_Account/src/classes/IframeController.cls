public with sharing class IframeController{

   public Boolean IfreameStatus{get;set;}
    
    public IframeController(){
        IfreameStatus=false;
    }
    
    public PageReference ShowFrame(){
        IfreameStatus=true;
        return null;
    }
    
    public PageReference HideFrame(){
        IfreameStatus=false;
        return null;
    }

}