@isTest(SeeAllData=false)
public class VechileMaintenance_Test {
	static testMethod void VechileMaintenanceTest() {
        Account acc = new account();
        acc.name = 'test acc';
        insert acc;
        
        Account acc1 = new account();
        acc1.name = 'test acc';
        insert acc1;
        
        contact con = new contact();
        con.lastname = 'con last';
        con.email='testcon@mailinator.com';
        con.accountId = acc.id;
        insert con;
        
        contact con1 = new contact();
        con1.lastname = 'con1 last';
        con1.email='testcon1@mailinator.com';
        con1.accountId = acc1.id;
        insert con1;
        
        list<Vechile__c> vechileList = new list<Vechile__c>();
        Vechile__c v = new Vechile__c();
        v.name = 'Vechile Test';
        v.Model__c = 'BMW x5';
        v.contact__c = con.id;
        v.Make__c='us';
        v.Year__c = date.today();
        v.Colour__c = 'white';
        v.Last_Service_Date__c = date.today();
        insert v;
        
        v.Odometer_Reading__c = 9500;
        update v;
        
        vechileList.add(v);
      
            
    }
}