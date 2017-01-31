trigger RestrictFileUpload on Attachment(after insert) {
    /*
    List<Attachment> lstAttachementTobeRestricted = new List<Attachment>();
    //trigger.new[0].addError('Cannot Upload file: RestrictFileUpload');
    for(Attachment at: trigger.New){
        system.debug('@AT@'+at);
        String fileName =  at.Name;
        system.debug('@AT FileName@'+fileName);
        Integer fileExtensionNo = fileName.IndexOf('.');
        system.debug('@AT FileName 1@'+fileExtensionNo);
        String fileext = fileName.substring(fileExtensionNo);
        system.debug('@AT FileName 2@'+fileext);
        if(fileext.equalsIgnoreCase('.exe')){
            lstAttachementTobeRestricted.add(at);
        }
    }
    
    for(Attachment att : lstAttachementTobeRestricted){
        att.addError('EXE not allowed');
    }
    */
    
    List<Blacklisted_Files__c> blackListedFiles = Blacklisted_Files__c.getAll().values();
    Set<String> blackListedExtensions = new Set<String>();
    for(Blacklisted_Files__c ww : blackListedFiles){
        blackListedExtensions.add(ww.File_Extension_Type__c);
    }
    for(Attachment a : trigger.New){
        if(a.Name != null) {
            List<String> splitName = a.Name.split('\\.');
            String extension = splitName.get(splitName.size()-1);
            
            if(blackListedExtensions.contains(extension)){
                a.addError('Blocked');
                continue;
            }
        }
    }
}