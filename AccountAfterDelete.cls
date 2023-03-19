trigger AccountTrigger on Account (After delete) {
    
    

    if(Trigger.isAfter && Trigger.isDelete){
        List<Messaging.SingleEmailMessage> emaillst = new List<Messaging.SingleEmailMessage>();
        for(Account acc : Trigger.old){
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
}
