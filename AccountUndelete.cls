trigger AccountTrigger on Account (After undelete) {
    
    

    if(Trigger.isAfter && Trigger.isunDelete){
        List<Messaging.SingleEmailMessage> emaillst = new List<Messaging.SingleEmailMessage>();
        for(Account acc : Trigger.new){
            List<string> useremail = new List<String>();
            useremail.add(userinfo.getUserEmail());
            Messaging.SingleEmailMessage emailobj = new Messaging.SingleEmailMessage();
            emailobj.setSubject('Account Restored ');
            emailobj.setPlainTextBody('your ' + acc.Name + ' Account Restored ');
            emailobj.setToAddresses(useremail);
            emaillst.add(emailobj);
            
        }
        Messaging.sendEmail(emaillst);
    }
}
