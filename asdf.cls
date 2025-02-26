public with sharing class AccountHandler {
    
    // Exposing method to be used in Lightning Components or LWC
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts() {
        return [SELECT Id, Name, Industry FROM Account LIMIT 10];
    }

    // Exposing method to insert a new Account
    @AuraEnabled
    public static String createAccount(String accountName) {
        try {
            Account acc = new Account(Name = accountName);
            insert acc;
            return 'Account Created with ID: ' + acc.Id;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
