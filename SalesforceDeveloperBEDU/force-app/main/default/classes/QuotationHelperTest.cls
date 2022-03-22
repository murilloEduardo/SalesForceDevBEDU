@IsTest
public class QuotationHelperTest {
    
@IsTest
	  static void initialConfig(){
 
         Test.startTest();
    	 QuotationHelper qt = new QuotationHelper();
         qt.initialConfig();
         Test.stopTest();
 
      }
    
@IsTest
    static void productsInInventory(){
        
        
       	Test.startTest();
    	QuotationHelper it = new QuotationHelper();
        it.productsInInventory();
        Test.stopTest();
        
        
        
    }
    
@IsTest  
    static void confirmProductExistsByCode(){

		Product2 p = new Product2();
		p.Name = 'Test';
		p.ExternalId = '0001';
		insert p;

        Test.startTest();
        QuotationHelper ct = new QuotationHelper();
        ct.confirmProductExistsByCode(p.ExternalId);
        Test.stopTest();
    }
@IsTest 
    static void searchProductByCode(){
        
        Inventario__c i = new Inventario__c();
        i.Name = 'TESSST';
        i.CodigoProd__c = '0004';
        i.Cantidad_dis__c = 20;
        insert i;
        
        Inventario__c n = new Inventario__c();
        n.Name = 'TESST';
        n.CodigoProd__c = '0003';
       
        insert n;
        
        Test.startTest();
        QuotationHelper st = new QuotationHelper();
        st.searchProductByCode('0004');
        st.searchProductByCode('TEST');
        st.searchProductByCode('0003');
        Test.stopTest();
    }
    
   
@IsTest(SeeAllData = true)
    public static void updateQuoteLineItem(){
        
       Quote z = [SELECT Id FROM Quote Where Id = '0Q08c0000019F3rCAE'];
        z.email = ('testFake@fake.com');
        update z;
        
        
         Test.startTest();
        QuotationHelper.updateQuoteLineItem(z);
        Test.stopTest();
        
        
    }    
    
   
}