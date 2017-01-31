public with sharing class SampleWebServiceCall {
    
    public string latitudeVal {get; set;}
    public string longitudeVal {get; set;}
    public SampleWebServiceCall() {}    
    public Map<String, String> webserviceInfo{get; set;} 
    
    public void weatherDetails() {
        
        webserviceInfo = new Map<String, String>();       
        String endPointUrl = 'http://api.openweathermap.org/data/2.5/weather?';
        String appId = '&appid=2de143494c0b295cca9337e1e96b00e0';
        String latVal = 'lat='+latitudeVal;
        String longVal = '&lon='+longitudeVal; 
        String finalUrl = endPointUrl+latVal+longVal+appId;  
        
        System.debug('@Final Url@'+finalUrl);
        
        Http htp = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(finalUrl);
        req.setMethod('GET');
        req.setTimeout(120000);
        req.setClientCertificateName('TestCertificate');
        HttpResponse httpres = htp.send(req);
        system.debug('@Response@'+httpres.getBody());
        
        JSONParser parser = JSON.createParser(httpres.getBody());
        while (parser.nextToken() != null) {
            if(parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                String fieldName = parser.getText();
                if(parser.nextToken() == JSONToken.START_ARRAY || parser.getCurrentToken() == JSONToken.START_OBJECT) {
                    parser.nextToken();
                }else {
                    system.debug('@@Field Name@@'+fieldName);
                    system.debug('@@Field Value@@'+parser.getText());
                    webserviceInfo.put(fieldName, parser.getText());
                }
            }
        }  
        system.debug('@@Map Info@@'+webserviceInfo.keySet());         
    }
}