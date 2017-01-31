trigger RestrictExeFileUpload on FeedItem (before insert, before update) {
    /*
    if(trigger.new[0].hasContent){
        String fileName =  trigger.new[0].ContentFileName;
        Integer fileExtensionNo = fileName.lastIndexOf('.');
        String fileext = fileName.substring(fileExtensionNo);
        if(fileext.equalsIgnoreCase('.exe')){
            trigger.new[0].addError('Exe Not Allow');
        }
    }
    */
    List<Blacklisted_Files__c> blackListedFiles = Blacklisted_Files__c.getAll().values();
    Set<String> blackListedExtensions = new Set<String>();
    for(Blacklisted_Files__c ww : blackListedFiles){
        blackListedExtensions.add(ww.File_Extension_Type__c);
    }
    
    for(FeedItem f : trigger.new){
        if(f.ContentFileName != null) {
            List<String> splitName = f.ContentFileName.split('\\.');
            String extension = splitName.get(splitName.size()-1);
            
            if(blackListedExtensions.contains(extension)){
                f.addError('Blocked');
                continue;
            }
        }
    }
}