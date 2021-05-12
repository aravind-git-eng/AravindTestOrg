trigger VechileMaintenance on Vechile__c (After update) {
    list<Vechile__c> vechileList = new list<Vechile__c>();
    if(trigger.isAfter){
        if(trigger.isUpdate){
            for(Vechile__c v : trigger.new){
                if(v.Odometer_Reading__c == Decimal.ValueOf(Label.Vechile_Odo_Reading) ||
                   v.Next_Service_Date__c == date.today()){
                   		vechileList.add(v); 
                }  
            }
            if(vechileList.size()>0)
            	CreateMaintenceRequestRec.createMaintenceRec(vechileList); 
        }
    }
}