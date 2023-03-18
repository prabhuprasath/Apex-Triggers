trigger contactTrigger on Contact (before insert,After insert, before update,before delete) {
    
    if(Trigger.isInsert && Trigger.isBefore){
        for(Contact con : Trigger.new){
            if(con.Phone.length()<10){
                con.addError('mobile number must have 10 digits');
            }
        }
    } 
    
    if(Trigger.isInsert && Trigger.isAfter){
        List<Case> caselist = new List<Case>();
        for(Contact con : Trigger.new){
            Case cs = new Case();
            cs.ContactId  = con.Id;
            cs.Subject = 'New Test case for contact after insert trigger';
            caselist.add(cs);
            
        }
        if(caselist.size()>0){
            insert caselist;
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