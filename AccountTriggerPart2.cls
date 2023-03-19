trigger AccountTrigger on Account (before insert,After insert,before update,Before delete,After delete,After undelete) {
    
    if(Trigger.isInsert && Trigger.isBefore){
        AccountTriggerHandler.accBeforeInsert(Trigger.new);
    }
    
    if(Trigger.isInsert && Trigger.isAfter){
		   AccountTriggerHandler.accAfterInsert(Trigger.new);
        
    }
    
    if(Trigger.isBefore && Trigger.isUpdate){
       	   AccountTriggerHandler.accBeforeUpdate(Trigger.newMap,Trigger.oldMap);
    }
        if(Trigger.isBefore && Trigger.isDelete){
		AccountTriggerHandler.accBeforeDelete(Trigger.old);
	}

    if(Trigger.isAfter && Trigger.isDelete){
		AccountTriggerHandler.accAfterDelete(Trigger.old);       
    }
    
    if(Trigger.isUndelete && Trigger.isAfter){
         AccountTriggerHandler.accAfterUnDelete(Trigger.new);      

        
    }
}