trigger AccountTriggersTest on Account (after insert, after update, after delete, after undelete) {
    
    if(Trigger.IsUpdate){
                AccountHelper.updateName();
    } else if (Trigger.IsDelete) {
        
    } else {}
        
    }
