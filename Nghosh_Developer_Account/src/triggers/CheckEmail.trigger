trigger CheckEmail on EmailMessage (before insert, after insert) {
    
    system.debug('@Incoming Mail From@'+trigger.new[0].FromAddress);
    system.debug('@Incoming Mail To@'+trigger.new[0].ToAddress);
    system.debug('@Incoming Mail Subject@'+trigger.new[0].Subject);
    system.debug('@Incoming Mail Body@'+trigger.new[0].TextBody);
}