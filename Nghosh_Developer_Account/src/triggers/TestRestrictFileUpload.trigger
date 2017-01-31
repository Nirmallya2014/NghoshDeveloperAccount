trigger TestRestrictFileUpload on ContentVersion(before insert, after insert) {
    List<ContentVersion> lstContentVersionTobeRestricted = new List<ContentVersion>();
    trigger.new[0].addError('Cannot Upload file:Test');
    for(ContentVersion at: trigger.New){
        system.debug('@AT@'+at);
        
        String fileName =  at.PathOnClient;
        List<String> fileNameithExtension = fileName.split('.');
        String fileExtension = fileNameithExtension[1];
        system.debug('@File Info@'+fileNameithExtension);
        if(fileExtension == 'exe'){
            lstContentVersionTobeRestricted.add(at);
        }
    }
    
    for(ContentVersion att : lstContentVersionTobeRestricted){
        att.addError('EXE not allowed');
    }
}