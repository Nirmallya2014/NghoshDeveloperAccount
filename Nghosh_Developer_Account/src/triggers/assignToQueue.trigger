trigger assignToQueue on Lead (after insert) {
        //Queue listQueue = [Select Id, SobjectType, QueueId, Queue.Name from QueueSobject where SobjectType = 'Lead' limit 1];
        Account acc = [select id from account limit 1];
}