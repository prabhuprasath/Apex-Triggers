trigger AccountTrigger on Account (After insert) {

    if(Trigger.isInsert && Trigger.isAfter){
        List<Opportunity> opplist = new List <Opportunity>();
        for(Account acc : Trigger.new){
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
}