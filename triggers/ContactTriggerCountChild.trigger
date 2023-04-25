trigger ContactTriggerCountChild on Contact (after insert, after update, after delete, after undelete) {
    if(trigger.isafter && trigger.isinsert){
        contactTriggeraHandler.afterInsertHandler(trigger.new);
    }
    if(trigger.isafter && trigger.isupdate){
        contactTriggeraHandler.afterUpdateHandler(trigger.new, trigger.oldmap);
    }
    if(trigger.isafter && trigger.isdelete){
        contactTriggeraHandler.afterDeleteHandler(trigger.old);
    }
    if(trigger.isafter && trigger.isundelete){
        contactTriggeraHandler.afterUndeleteHandler(trigger.new);
    }
}