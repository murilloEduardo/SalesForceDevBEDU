public class CustomWebInventoryController {

    //Obtenemos las variables de sus respectivas tablas
    private final sObject parent;
    public String productCode{get;set;}
    public String productName{get;set;}
    public Double productPrice{get;set;}
    public String productExternalId{get;set;}
    public Double productQuantity{get;set;}
    public Double productInStock{get;set;}
    
   QuoteLineItem i3 = new QuoteLineItem();
    
    
    public CustomWebInventoryController(ApexPages.StandardController controller){
        parent =controller.getRecord();
    }
    
    public void Find(){
        List<Product2> i1 = new List<Product2>();
        Pricebook2 i2 = new Pricebook2();
        
       
        Inventario__c i4 = new Inventario__c();
        
        i1.add([SELECT ProductCode, ExternalId, Name FROM Product2 WHERE ProductCode =:productCode]);
        
        if (i1.size()>0){
            productName = i1[0].Name;
            productExternalId = i1[0].ExternalId;
            
            PriceBookEntry pbe = [SELECT UnitPrice, Id FROM PriceBookEntry WHERE Product2Id=:i1[0].Id LIMIT 1];
            productPrice = pbe.UnitPrice;
           
            i4 = [SELECT Cantidad_dis__c FROM Inventario__c WHERE CodigoProd__c=:i1[0].ProductCode LIMIT 1];
            productInStock = i4.Cantidad_dis__c;
            
            
            i3.QuoteId = parent.Id;
            i3.Product2Id = i1[0].Id;
            i3.UnitPrice = productPrice;
            i3.PriceBookEntryId = pbe.Id; 
            
        }
    }
        
        public void Guardar() {
            
        i3.Quantity = productQuantity;
        insert i3;
        
        }    
    
    	public void cancel(ApexPages.StandardController controller){
            
        controller.cancel();
    }
    
    public void cancel1(ApexPages.StandardController controller){
        
        controller.cancel();
        
        
    }
    
    
    }