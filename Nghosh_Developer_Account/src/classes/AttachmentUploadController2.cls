public with sharing class AttachmentUploadController2 
{
    public String parentId {get;set;}
    public Attachment attach {get;set;}
   
    public AttachmentUploadController2()
    {
        attach = new Attachment();
    }
   
    public ApexPages.Pagereference upload()
    {
        system.debug('@Attachment in Controller@'+attach);
        //This shows how to insert an Attachment
        try {
            attach.ParentId = parentId;
            if(attach.name != null) {
                insert attach;
                system.debug('@@Attach@@'+attach);
                return new ApexPages.Standardcontroller(attach).view();
            }
            return null;
        }catch(Exception ex) {
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, ex.getMessage());
             ApexPages.addMessage(myMsg);
            return null;
        }
           
    }
}