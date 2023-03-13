# Apex-Triggers
This repo is for practice purpose regarding salesforce Apex Trigger </>
Using Trigger.isBefore,Trigger.isAfter ----> Before event and After event
operations --- > Insert , update , Delete ,undelete
context variable - Trigger.old , Trigger.new , Trigger.oldmap , Trigger.newmap

when to use before and after operation

Before - prepopulate any field on the same record , throw error on validating the record

/** Don't try of prepoplating other object records **/

After - update any other obj records , Any other actions (sending emails , calling external system etc)

