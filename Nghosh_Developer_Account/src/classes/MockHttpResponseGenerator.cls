@isTest
global class MockHttpResponseGenerator implements HttpCalloutMock {
    // Implement this interface method
    global HTTPResponse respond(HTTPRequest req) {
        // Optionally, only send a mock response for a specific endpoint
        // and method.
        System.assertEquals('http://api.openweathermap.org/data/2.5/weather?lat=22.8745&lon=88.3652&appid=2de143494c0b295cca9337e1e96b00e0', req.getEndpoint());
        System.assertEquals('GET', req.getMethod());
        
        // Create a fake response
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{"firstName":"John"}');    
        res.setStatusCode(200);
        return res;
    }
}