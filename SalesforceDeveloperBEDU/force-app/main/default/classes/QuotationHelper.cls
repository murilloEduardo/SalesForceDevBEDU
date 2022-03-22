//Create 2 Objects with the Class QuotationHelper::::::::::::::::PostWork 1
public class QuotationHelper implements QuotationSync {
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
    public  static void updateQuoteLineItem(Quote qt){

            Quote qt_2 = [Select Id, Name, (Select Id, Quantity, Product2Id  from QuoteLineItems) From Quote WHERE Id =:qt.Id];

        // Create an empty list
        List<Product2> product2List = new List<Product2>();

        // Fill the list with items(products)
        for(QuoteLineItem item : qt_2.QuoteLineItems){
            product2List.add([SELECT ProductCode, ExternalId FROM Product2 WHERE Id =: item.Product2Id]);
        }
        //Instantiate QuotationHelper then Create an empty list
        QuotationHelper qth = new QuotationHelper();

        List<Inventario__c> inv = new List<Inventario__c>();
                                                                
        // Now, we need to confirm if the products exists in the inventory, 
        // then if they actually does exists, the next step is to ADD to the list of inventories 
        // to be finanlly updated.
        
        for (Product2 p : product2List) {
            try {
                if(qth.confirmProductExistsByCode(p.ExternalId)){
                    Inventario__c inv_2 = [SELECT Id, Cantidad_apart__c FROM Inventario__c WHERE CodigoProd__c = :p.ProductCode];
                    QuoteLineItem qli = [SELECT Quantity FROM QuoteLineItem WHERE Product2Id =:p.Id];
                    Double qtyUpdate = qli.Quantity;
                    inv_2.Cantidad_apart__c += qtyUpdate;
                    inv.add(inv_2);
                }
            } catch (Exception err) {
                
            }
        }

        update inv;
     



        }
      

}