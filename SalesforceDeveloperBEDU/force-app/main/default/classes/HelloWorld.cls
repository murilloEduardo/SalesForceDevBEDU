public class HelloWorld {
    String test;
    void hello(){
        System.debug('Hola mundo');
    	String str;
        Integer i = 0;
        this.test = 'Adiós';
        
        if (i>0){
            this.test = 'Es mayor';
        } else {
            this.test = 'Es cero o menor';
        }
        
        Account acc = new Account();
         
        Inventario__c inv = new Inventario__c();
        inv.Name = 'Test';
        inv.Cantidad_Apart__c = 3;
        
        List<sObject> lst = new List<sObject>();
        lst.add(inv);
        lst.add(acc);
        
        String nameInv = 'Test';
        Inventario__c inv2 = [SELECT id, Name from Inventario__c WHERE Name = :nameInv LIMIT 1];
        sObject inv3 = [SELECT id, Name from Inventario__c WHERE Name = :nameInv LIMIT 1];
        List<Object> lst2 = [SELECT id, Name from Inventario__c WHERE Name = :nameInv LIMIT 1];
        
        
        for(Object consulta :lst2){
            System.debug('Result' + lst2);
        }
	}
    public void Hello2(){
        this.test = 'Hola';
    }
    
    public void HelloSOSL(){
        List<List<sObject>> result = [FIND 'United'
            IN ALL FIELDS
            RETURNING
                Account(Id, Name, Type
                WHERE Rating = 'Hot'
                ORDER BY CreatedDate DESC),
                Lead(Id, Name, Company
                ORDER BY CreatedDate),
                Contact(Id, Name, Account.Name
                ORDER BY Account.Name, LastName),
                Opportunity(Id, Name, Account.Name
                ORDER BY CreatedDate)];
    }
    
    /*public void elloSOHSL(){
        List<List<sObject>> result = [FIND 'United'
            IN ALL FIELDS
            RETURNING
                        Account(Mail ORDER BY CreatedDate),
                        Contact(website ORDER BY Account.Name)];
}*/

    public void DML(){
        Inventario__c inv = new Inventario__c();
        inv.Name = 'Test';
        inv.Cantidad_Apart__c = 3;
        //INSERT inv;
        
        Inventario__c inv2 = new Inventario__c();
        inv2.Name = 'Test2';
        inv2.Cantidad_Apart__c = 3;
        //INSERT inv;
        
        List<Inventario__C> lst = new List<Inventario__C>();
        lst.add(inv);
        lst.add(inv2);
        
        INSERT lst;
    }
}