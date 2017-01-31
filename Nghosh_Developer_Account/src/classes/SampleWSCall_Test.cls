@isTest
global with sharing class SampleWSCall_Test{

    static testMethod void WSCall_Test_Method1() {
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        
        // Call method to test.
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
        SampleWebServiceCall wsCall = new SampleWebServiceCall();
        wsCall.latitudeVal = '22.8745';
        wsCall.longitudeVal = '88.3652';
        
        wsCall.weatherDetails();
    }
    
}