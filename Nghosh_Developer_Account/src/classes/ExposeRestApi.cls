@RestResource(urlMapping='/ExposeRest/*')
global with sharing class ExposeRestApi {

    @HttpPost
    global static String testRestApi(string str) 
    {
        return 'Test123'+str;
    }
}