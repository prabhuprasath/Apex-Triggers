trigger AccountTrigger on Account (before insert,Before update,Before delete) {
    
    if(Trigger.isInsert){
        if(Trigger.isBefore){
            accountTriggerHandler.validateActiveField(Trigger.new);
        }
    }
    
    if(Trigger.isUpdate){
        if(Trigger.isBefore){
            accountTriggerHandler.updateTypeField(Trigger.new);
        }
    }
    
    if(Trigger.isDelete){
        if(Trigger.isBefore){
            accountTriggerHandler.checkRatingFieldBeforeDeletion(Trigger.old);
        }
    }
    
}