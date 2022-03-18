trigger QuotationHelperTrigger on Quote (After update) {

    if(Trigger.isUpdate){
        //Creating an object after update
        Quote qt = Trigger.new[0];
        //Here Im calling all the records using Produc2Id from QuoteLineItems
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
                if(qth.confirmProductExistByCode(p.ExternalId)){
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