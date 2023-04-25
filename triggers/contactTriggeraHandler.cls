public class contactTriggeraHandler {
    public static void afterInsertHandler(list<contact> contactnewlist){
     	 Set<Id> accountIds = new Set<Id>();
        for (Contact con : contactnewlist) {
            if (String.isNotBlank(con.AccountId)) {
                accountIds.add(con.AccountId);
            }
        }
        List<AggregateResult> results = [SELECT AccountId, COUNT(Id) totalContacts FROM Contact WHERE  AccountId IN :accountIds GROUP BY AccountId];
        List<Account> accountsToUpdate = new List<Account>();
        for (AggregateResult result : results) {
            String accId = String.valueOf(result.get('AccountId'));
            Integer totalContacts = Integer.valueOf(result.get('totalContacts'));
            Account acc = new Account(Id = accId, Number_of_Contacts__c = totalContacts);
            accountsToUpdate.add(acc);
        }
        update accountsToUpdate;
    }
    
    public static void afterUpdateHandler(List<Contact> contactnewlist, Map<Id, Contact> oldContactsMap){
         Set<Id> accountIds = new Set<Id>();
        for (Contact con : contactnewlist) {
            if (String.isNotBlank(con.AccountId)) {
                accountIds.add(con.AccountId);
            } else if (oldContactsMap.get(con.Id).AccountId != con.AccountId) {
                accountIds.add(con.AccountId);
                accountIds.add(oldContactsMap.get(con.Id).AccountId);
            }
        }
         List<AggregateResult> results = [SELECT AccountId, COUNT(Id) totalContacts FROM Contact WHERE  AccountId IN :accountIds GROUP BY AccountId];
        List<Account> accountsToUpdate = new List<Account>();
        for (AggregateResult result : results) {
            String accId = String.valueOf(result.get('AccountId'));
            Integer totalContacts = Integer.valueOf(result.get('totalContacts'));
            Account acc = new Account(Id = accId, Number_of_Contacts__c = totalContacts);
            accountsToUpdate.add(acc);
        }
        update accountsToUpdate;
    }
     public static void afterDeleteHandler(List<Contact> oldContacts) {
        Set<Id> accountIds = new Set<Id>();
        for (Contact con : oldContacts) {
            if (String.isNotBlank(con.AccountId)) {
                accountIds.add(con.AccountId);
            }
        }
          List<AggregateResult> results = [SELECT AccountId, COUNT(Id) totalContacts FROM Contact WHERE  AccountId IN :accountIds GROUP BY AccountId];
        List<Account> accountsToUpdate = new List<Account>();
        for (AggregateResult result : results) {
            String accId = String.valueOf(result.get('AccountId'));
            Integer totalContacts = Integer.valueOf(result.get('totalContacts'));
            Account acc = new Account(Id = accId, Number_of_Contacts__c = totalContacts);
            accountsToUpdate.add(acc);
        }
        update accountsToUpdate;
        
    }
    public static void afterUndeleteHandler(List<Contact> newContacts) {
        Set<Id> accountIds = new Set<Id>();
        for (Contact con : newContacts) {
            if (String.isNotBlank(con.AccountId))
                accountIds.add(con.AccountId);
            }
         List<AggregateResult> results = [SELECT AccountId, COUNT(Id) totalContacts FROM Contact WHERE  AccountId IN :accountIds GROUP BY AccountId];
        List<Account> accountsToUpdate = new List<Account>();
        for (AggregateResult result : results) {
            String accId = String.valueOf(result.get('AccountId'));
            Integer totalContacts = Integer.valueOf(result.get('totalContacts'));
            Account acc = new Account(Id = accId, Number_of_Contacts__c = totalContacts);
            accountsToUpdate.add(acc);
        }
        update accountsToUpdate;
        }
        
    
    
    
    
}