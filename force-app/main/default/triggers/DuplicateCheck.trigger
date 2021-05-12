trigger DuplicateCheck on Maintenance_Request__c (before insert) {
    map<id,id> vechileToMRRec = new map<id,id>();
    set<id> vechileIds = new set<id>();
    if(trigger.isBefore && trigger.isInsert){
        for(Maintenance_Request__c mr : trigger.new){
            if(mr.Vechile__c!=null){
                vechileIds.add(mr.Vechile__c);
            }   
        }
        for(Maintenance_Request__c mr : [select id, Vechile__c from Maintenance_Request__c where Vechile__c In:vechileIds
                                     and (Status__c!='Completed' or Status__c!='Cancelled')]){
            if(mr.id!=null && mr.Vechile__c != null){
                vechileToMRRec.put(mr.Vechile__c,mr.id);   
            }
        
    }
    system.debug('_____vechileToMRRec___'+vechileToMRRec);
    if(vechileToMRRec.keySet().size()>0){
    	for(Maintenance_Request__c mr : trigger.new){
        	if(mr.Vechile__c!=null && vechileToMRRec.get(mr.Vechile__c)!=null){
                mr.addError('Already active maintenance record exists for the selected vechile');
           }
    	}   
    }
    }
}