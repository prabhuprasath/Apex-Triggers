public class accountTriggerHandler {
    
    public static void validateActiveField(List <Account> accs){
        for(Account acc : accs){
            if(acc.Active__c != 'Yes'){
                acc.Active__c.addError('Make sure Account is Active');
            }
        }
    }

    public static void updateTypeField(List<Account> accs){
        for(Account acc : accs){
            if(acc.Type == 'Customer - Direct'){
                acc.Ownership = 'Public';
            }
        }
    }
    
    
    public static void checkRatingFieldBeforeDeletion(List<Account>accs){
        for(Account acc : accs ){
            if(acc.Rating == null){
                acc.Rating.addError('Before Deleting Ensure you have filled Rating Field');
            }
        }
    }
}