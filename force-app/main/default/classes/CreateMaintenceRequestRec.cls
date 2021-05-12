public class CreateMaintenceRequestRec {
    public static void createMaintenceRec(list<Vechile__c> vechileList){
        list<Maintenance_Request__c> insertMRList = new list<Maintenance_Request__c>();
        set<id> conIds = new set<id>();
        for(Vechile__c v : vechileList){
            if(v.contact__c!=null)
                conIds.add(v.contact__c);
        }
        //map to get email id of respective contact
        Map<ID, contact> conToEmail = new Map<ID, contact>([SELECT Id, Name,email,lastname FROM contact where id In:conIds]);
        //creation of Maintenance records
        for(Vechile__c v : vechileList){
            system.debug('___test class exception+____'+v);
            Maintenance_Request__c mrRec = new Maintenance_Request__c(name=v.name+' '+ conToEmail.get(v.contact__c).lastName + ' Request', 
                                                                      Maintenance_Date__c = v.Next_Service_Date__c,
                                                                      Status__c = 'Not Confirmed',
                                                                      Odometer_Reading__c = v.Odometer_Reading__c,
                                                                      Vechile__c = v.id,
                                                                      Customer_Email__c = conToEmail.get(v.contact__c).Email);
            insertMRList.add(mrRec);
        }
        if(insertMRList.size()>0)
            insert insertMRList;
        
    }
}