//Create 2 Objects with the Class QuotationHelper::::::::::::::::PostWork 1
public class QuotationHelper implements QuotationSync, Database.Batchable<SObject>, Database.Stateful {
        public void initialConfig(){
            Account acc = new Account();
            acc.Name = 'Compumundo';
                INSERT acc;
            Account acc2 = new Account();
            acc2.Name = 'Compuworld';
            	INSERT acc2;
   }
    //Find all of the products with a method called productsInInventory:::::::::::::::::Postwork 2
                 
        public List<Inventario__c> productsInInventory(){
        List<Inventario__c> invActual = [SELECT Id, Name, Cantidad_Apart__c, Cantidad_dis__c, CodigoProd__c FROM Inventario__c];
        return invActual;
            }
    
    
    //Postwork 3

        public Boolean confirmProductExistsByCode(String productCode){
            Boolean exist = false;

            List<Product2> productList = [SELECT ID FROM Product2 WHERE ExternalId = :productCode LIMIT 1];

            if(productList.size()>0){
                exist = true;
            }
                return exist;
        }

        public Double searchProductByCode(String productCode){
            List<Inventario__c> inventory = [SELECT Cantidad_dis__c FROM Inventario__C WHERE CodigoProd__c = :productCode LIMIT 1];
            if(inventory.size()<=0){
                system.debug('non existent records');
                return 0;
            }else{
                if(inventory[0].Cantidad_dis__c == null || inventory[0].Cantidad_dis__c < 0){
                    return 0;
                }else{
                    return inventory[0].Cantidad_dis__c;
                 }
                }
                
            
        }

    
 }