public class accountTriggerHandler{
    public static void accountBeforeInsert(List<Account> accs){
        for(Account acc : accs){
            if(acc.check_me__c != true){
                acc.addError('check the check me checkbox'); 
            }
            
            
        }
        
    }
    
    public static void accountAfterInsert(List<Account> accs){
        List<Contact> cons = new List<Contact>();
        for(Account acc : accs){
            Contact con = new Contact();
          	con.FirstName = 'TEST';
            con.LastName = acc.Name;
            con.AccountId = acc.Id;
            cons.add(con);
        }
        if(cons.size()>0){
            insert cons;
        }
    }
    
    public static void accountBeforeUpdate(List<Account> accs , Map<Id,Account> accountOldMap){
         for(Account acc : accs){
            Account accOldMap = accountOldMap.get(acc.id);
            if(accOldMap.Industry != acc.Industry){
                acc.addError('Industry cannot be modifiled');
            }
            
        }
    }
    
   
    
    
}