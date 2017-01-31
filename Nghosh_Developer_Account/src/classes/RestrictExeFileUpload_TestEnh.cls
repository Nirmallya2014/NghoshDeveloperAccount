@isTest
public class RestrictExeFileUpload_TestEnh {

    static testMethod void testWithExeFileUpload() {
        Case cse = new Case();
        cse.Status = 'Active';
        insert cse;
        
        FeedItem fItem = new FeedItem();
        fItem.body = 'Hello';
        fItem.parentId = cse.Id;
        fItem.ContentData = EncodingUtil.base64Decode('fluffykittens');
        fItem.ContentFileName = 'Capture.PNG';
        insert fItem;
        
        FeedItem fItem1 = new FeedItem();
        fItem1.body = 'Hello';
        fItem1.parentId = cse.Id;
        fItem1.ContentData = EncodingUtil.base64Decode('fluffykittens');
        fItem1.ContentFileName = 'Capture.EXE';
        try {
            insert fItem1;
        }catch(Exception ex) {
            
        }
    }
    
    static testMethod void testWithPNGFileUpload() {
        Case cse = new Case();
        cse.Status = 'Active';
        insert cse;
        
        FeedItem fItem = new FeedItem();
        fItem.body = 'Hello';
        fItem.parentId = cse.Id;
        fItem.ContentData = EncodingUtil.base64Decode('fluffykittens');
        fItem.ContentFileName = 'Capture.PNG';
        insert fItem;
        
        FeedItem fItem1 = new FeedItem();
        fItem1.body = 'Hello';
        fItem1.parentId = cse.Id;
        fItem1.ContentData = EncodingUtil.base64Decode('fluffykittens');
        fItem1.ContentFileName = 'Capture.EXE';
        try {
            insert fItem1;
        }catch(Exception ex) {
            
        }

    }

}