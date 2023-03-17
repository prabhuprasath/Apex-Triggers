trigger contactTrigger on Contact (before insert, before update,before delete) {
    
    if(Trigger.isInsert && Trigger.isBefore){
        for(Contact con : Trigger.new){
            if(con.Phone.length()<10){
                con.addError('mobile number must have 10 digits');
            }
        }
    }
    
    if(	Trigger.isUpdate && Trigger.isBefore){
        for(Contact con : Trigger.new){
            con.Level__c = 'Secondary';
            
        }
    }
    
    if(Trigger.isDelete){
        if(Trigger.isBefore){
            for(Contact con : Trigger.old){
                if(con.AccountId == null){
                    con.AccountId.addError('fill account name before delete operation');
                }
            }
        }
    }
}


