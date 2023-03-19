public class AccountTriggerHandler {
    
    public static void accBeforeInsert(List<Account> acclst){
        for(Account acc : acclst){
            if(acc.Phone.length() < 10){
                acc.addError('phone must have 10 digits');
            }
            else if(acc.Name.length() < 10){
                acc.addError('Name == 10 digits');
            }
        }
    }
    
    public static void accAfterInsert(List<Account> acclst){
        List<Opportunity> opplist = new List <Opportunity>();
        for(Account acc : acclst){
            Opportunity opp = new Opportunity();
            opp.Name = acc.Name;
            opp.StageName = 'Prospecting';
            opp.CloseDate = system.today();
            opp.AccountId = acc.Id;
            
            opplist.add(opp);
        }
        if(opplist.size()>0)
            insert opplist;
        
    }
    public static void accBeforeUpdate(map<Id,Account>accNewMap,map<Id,Account>accOldMap){
        for(Account acc : accNewMap.values()){
            
            if(accNewMap.get(acc.id).Type != accOldMap.get(acc.id).Type){
                acc.addError('Type modify panna mudiyadhu');
            }
            
        }
    }
    
    public static void accBeforeDelete(List<Account>acclst){
        for(Account acc : acclst){
		acc.addError('Delete is not possible');
		}
    }
    
    public static void accAfterDelete(List<Account>acclst){
         List<Messaging.SingleEmailMessage> emaillst = new List<Messaging.SingleEmailMessage>();
        for(Account acc : acclst){
            List<string> useremail = new List<String>();
            useremail.add(userinfo.getUserEmail());
            Messaging.SingleEmailMessage emailobj = new Messaging.SingleEmailMessage();
            emailobj.setSubject('Account deleted ');
            emailobj.setPlainTextBody('your ' + acc.Name + 'Account deleted');
            emailobj.setToAddresses(useremail);
            emaillst.add(emailobj);
            
        }
        Messaging.sendEmail(emaillst);
    }
    
    public static void accAfterUndelete(List<Account>acclst){
        List<Messaging.SingleEmailMessage> emaillst = new List<Messaging.SingleEmailMessage>();
        for(Account acc : acclst){
            List<string> useremail = new List<String>();
            useremail.add(userinfo.getUserEmail());
            Messaging.SingleEmailMessage emailobj = new Messaging.SingleEmailMessage();
            emailobj.setSubject('Account Restored ');
            emailobj.setPlainTextBody('your ' + acc.Name + ' Account restored succesfully	');
            emailobj.setToAddresses(useremail);
            emaillst.add(emailobj);
            
        }
        Messaging.sendEmail(emaillst);
    }
    
}