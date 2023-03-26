trigger AccountTrigger on Account (before insert,After insert,Before update,After update) {
    
    
    if(Trigger.isBefore && Trigger.isInsert){
        accountTriggerHandler.accountBeforeInsert(Trigger.new);
    }
    
    if(Trigger.isAfter && Trigger.isInsert){
       accountTriggerHandler.accountAfterInsert(Trigger.new);
    }
    
    if(Trigger.isUpdate && Trigger.isBefore){
       accountTriggerHandler.accountBeforeUpdate(Trigger.new,Trigger.oldMap);
    }
    
   
    
   
    }
