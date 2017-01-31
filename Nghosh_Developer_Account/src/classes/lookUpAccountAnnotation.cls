global class lookUpAccountAnnotation {

   @InvocableMethod
   public static List<Account> getAccountNames(List<String> names) {
       
      system.debug('----------@@Inside Invocable method'+names);
      List<Account> accountList = new List<Account>();
      List<Account> accounts = [SELECT Id, Name, Owner.Name, Phone FROM Account WHERE Type In: names];
      for (Account account : accounts) 
      {
         accountList.add(account);
      }
      system.debug('------@@ Account names :'+accountList);
      return accountList;
   }
}