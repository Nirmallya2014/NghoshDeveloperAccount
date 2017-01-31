global class Test_SendEmailToVitalityUsers implements Messaging.InboundEmailHandler {
      
      global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope envelope) {
          
          //String[] parts = email.plainTextBody.split('\n');
         // String username = parts[0].trim();
          //String activationLink = parts[1].trim();
                   
          System.debug('PlainTextBody: ' + email.plainTextBody);
          
          //User targetUser = [SELECT Id,Email FROM User WHERE Username = :String.valueOf(email.subject)]; // AND isportaluser (or community), isactive, etc.
          //EmailTemplate template = [SELECT Id FROM EmailTemplate WHERE Name = :email.subject];
          
          Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
          //message.setTemplateId(template.Id);
          //message.setTargetObjectId(targetUser.ContactId);
          //message.setWhatId(targetUser.Id);
          message.setHtmlBody(email.htmlBody);
          message.setToAddresses(new String[] {'ghossubha@gmail.com'});
          
          Messaging.sendEmail(new Messaging.SingleEmailMessage[] {message});
            
          System.debug('@Message@'+message);
          
          Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();
          return result;
      }
  }