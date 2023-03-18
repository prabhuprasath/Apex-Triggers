trigger OpportunityTrigger on Opportunity (before insert) {
    
    if(Trigger.isInsert && Trigger.isBefore){
        for(Opportunity opp : Trigger.new){
            if(opp.CurrentGenerators__c == null){
                opp.CurrentGenerators__c = opp.MainCompetitors__c;
                
            }
            if(opp.OrderNumber__c == null){
                opp.OrderNumber__c = opp.TrackingNumber__c;
            }
            if(opp.IsPrivate == true){
                opp.IsPrivate.addError('Before insert operation isprivate must be unchecked');
            }
            
        }
    }
}