global with sharing class SandboxConfiguration {

    global Map<String,String> expectedLinkDetails{get;set;}
    global Map<String,String> actualLinkDetails{get;set;}
    global Map<String,String> differLinkDetails{get;set;}
    global void linkInfo() {
        expectedLinkDetails = new Map<String, String>();
        actualLinkDetails = new Map<String, String>();
        differLinkDetails = new Map<String, String>();
        List<CCT_URL__c> cctUrl = [select id, name, linkname__c, linkurl__c from CCT_URL__c];
        system.debug('@CCT_URL__c@'+cctUrl);
        if(cctUrl != null && cctUrl.size() > 0) {
            for(CCT_URL__c cUrl : cctUrl) {
                system.debug('@cUrl@'+cUrl);
                system.debug('@cUrl@'+cUrl.LinkName__c);
                system.debug('@cUrl@'+cUrl.LinkUrl__c);
                expectedLinkDetails.put(cUrl.LinkName__c, String.valueOf(cUrl.LinkUrl__c));
            }
            for(CCT_URL__c cUrl : cctUrl) {
                system.debug('@cUrl@'+cUrl);
                system.debug('@cUrl@'+cUrl.LinkName__c);
                system.debug('@cUrl@'+cUrl.LinkUrl__c);
                actualLinkDetails.put(cUrl.LinkName__c, String.valueOf(cUrl.LinkUrl__c));
            }
        }
        system.debug('@linkdetails size@'+expectedLinkDetails.size());
    }
}